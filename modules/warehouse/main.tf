terraform {
  required_providers {
    snowflake = {
      source = "snowflakedb/snowflake"
    }
  }
}

resource "snowflake_warehouse" "this" {
  for_each = var.warehouse_definitions

  name           = upper(each.key)
  warehouse_size = each.value.warehouse_size
  auto_suspend   = each.value.auto_suspend
  auto_resume    = each.value.auto_resume
}