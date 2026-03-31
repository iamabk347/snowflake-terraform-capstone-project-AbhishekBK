terraform {
  required_providers {
    snowflake = {
      source = "snowflakedb/snowflake"
    }
  }
}

resource "snowflake_database" "this" {
  for_each = var.database_definitions

  name = upper(each.key)
}