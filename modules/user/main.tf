terraform {
  required_providers {
    snowflake = {
      source = "snowflakedb/snowflake"
    }
  }
}

resource "snowflake_user" "this" {
  for_each = var.user_definitions

  name         = upper(each.value.login_name)
  login_name   = each.value.login_name
  display_name = each.value.display_name
  email        = each.value.email

  default_role = each.value.default_role
}