terraform {
  required_providers {
    snowflake = {
      source = "snowflakedb/snowflake"
    }
  }
}

resource "snowflake_account_role" "this" {
  for_each = toset(var.role_names)

  name = each.value
}