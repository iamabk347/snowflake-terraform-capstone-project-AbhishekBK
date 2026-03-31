module "warehouse" {
  source                = "./modules/warehouse"
  warehouse_definitions = var.warehouse_definitions

  providers = {
    snowflake = snowflake
  }
}

module "database" {
  source               = "./modules/database"
  database_definitions = var.database_definitions

  providers = {
    snowflake = snowflake
  }
}

module "role" {
  source     = "./modules/role"
  role_names = var.role_names

  providers = {
    snowflake = snowflake
  }
}

module "user" {
  source           = "./modules/user"
  user_definitions = var.user_definitions

  providers = {
    snowflake = snowflake
  }
}

module "grant" {
  source = "./modules/grant"

  role_names     = var.role_names
  warehouse_name = "COMPUTE_WH_CUSTOM"
  database_names = module.database.database_names
  role_for_db    = "DATA_ENGINEER"

  user_role_map = {
    DATA_ENGINEER_USER = "DATA_ENGINEER"
    DATA_ANALYST_USER  = "DATA_ANALYST"
  }

  providers = {
    snowflake = snowflake
  }
}