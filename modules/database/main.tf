# This module helps Snowflake databases
# dynamically using for_each

terraform {
  required_providers {
    snowflake = {
      source = "snowflakedb/snowflake"
    }
  }
}

# Create one database for each entry in the
# database_definitions input map

resource "snowflake_database" "this" {
  for_each = var.database_definitions

# Database name derived from key and converted to uppercase:

  name = upper(each.key)
}