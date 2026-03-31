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
resource "snowflake_grant_privileges_to_account_role" "database_usage" {
  for_each = var.database_names

  privileges        = ["USAGE"]
  account_role_name = var.role_for_db

  on_account_object {
    object_type = "DATABASE"
    object_name = upper(each.value)
  }
}

# Grant schema usage
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