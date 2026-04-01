# connecting all reusable Terraform modules for further usage
# and passing the required inputs to each module here

# Warehouse Module:
# Provisioning Snowflake virtual warehouses dynamically
# based on definitions provided in terraform.auto.tfvars.

module "warehouse" {
  source                = "./modules/warehouse"
  warehouse_definitions = var.warehouse_definitions

  providers = {
    snowflake = snowflake
  }
}

# Database Module:
# Snowflake databases and schemas are being configured here.
# variable-driven configuration is used

module "database" {
  source               = "./modules/database"
  database_definitions = var.database_definitions

  providers = {
    snowflake = snowflake
  }
}

# Role Module:
# Created Snowflake account roles required for RBAC

module "role" {
  source     = "./modules/role"
  role_names = var.role_names

  providers = {
    snowflake = snowflake
  }
}

# User Module:
# Creates Snowflake users and assigns default roles as required

module "user" {
  source           = "./modules/user"
  user_definitions = var.user_definitions

  providers = {
    snowflake = snowflake
  }
}

# Grant Module:
# Applies RBAC permissions with respect to the following:
# - warehouse usage
# - database usage
# - schema usage
# - role to user assignments

module "grant" {
  source = "./modules/grant"

  role_names     = var.role_names
  warehouse_name = "COMPUTE_WH_CUSTOM"
  database_names = module.database.database_names
  role_for_db    = "DATA_ENGINEER"


  # Mapping Snowflake users to the account roles they should receive:

  user_role_map = {
    DATA_ENGINEER_USER = "DATA_ENGINEER"
    DATA_ANALYST_USER  = "DATA_ANALYST"
  }

  providers = {
    snowflake = snowflake
  }
}