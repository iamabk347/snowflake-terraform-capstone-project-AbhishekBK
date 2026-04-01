# Warehouse Module:
# This module provisionis used for Snowflake virtual warehouses
# for_each is used dynamically

terraform {
  required_providers {
    snowflake = {
      source = "snowflakedb/snowflake"
    }
  }
}

# snowflake_warehouse resource
# Creates one warehouse for each entry in the warehouse_definitions input map:

resource "snowflake_warehouse" "this" {
  for_each = var.warehouse_definitions

# Warehouse name is derived from the key and converted to uppercase 
#for consistency with Snowflake conventions

  name           = upper(each.key)
  warehouse_size = each.value.warehouse_size
  auto_suspend   = each.value.auto_suspend
  auto_resume    = each.value.auto_resume
}