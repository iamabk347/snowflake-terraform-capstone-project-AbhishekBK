# implementing Role-Based Access Control (RBAC)
# by assigning privileges to roles and mapping roles to users:


terraform {
  required_providers {
    snowflake = {
      source = "snowflakedb/snowflake"
    }
  }
}

# Grant warehouse usage to roles
resource "snowflake_grant_privileges_to_account_role" "warehouse_usage" {
  for_each = toset(var.role_names)

  privileges        = ["USAGE"]
  account_role_name = each.value

  on_account_object {
    object_type = "WAREHOUSE"
    object_name = var.warehouse_name
  }
}

# Grant database usage
# Grants USAGE privilege on databases to a specific role
resource "snowflake_grant_privileges_to_account_role" "database_usage" {
  for_each = var.database_names

  privileges        = ["USAGE"]
  account_role_name = var.role_for_db

  on_account_object {
    object_type = "DATABASE"
    object_name = upper(each.value)
  }
}

# Schema Usage Grant
# Grants USAGE privilege on schemas within each database:

resource "snowflake_grant_privileges_to_account_role" "schema_usage" {
  for_each = var.database_names

  privileges        = ["USAGE"]
  account_role_name = var.role_for_db

  on_schema {
    schema_name = "${upper(each.value)}.RAW"
  }
}

# Assign roles to users
resource "snowflake_grant_account_role" "assign_role" {
  for_each = var.user_role_map

  role_name = each.value
  user_name = each.key
}