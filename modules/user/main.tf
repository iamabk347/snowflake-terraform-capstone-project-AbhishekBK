# This module helps Snowflake users dynamically
# based on input definitions

terraform {
  required_providers {
    snowflake = {
      source = "snowflakedb/snowflake"
    }
  }
}

# snowflake_user resource
# Creates one user for each entry in user_definitions map

resource "snowflake_user" "this" {
  for_each = var.user_definitions

# User login name:
  name         = upper(each.value.login_name)
  login_name   = each.value.login_name

# Display name for reading: 
  display_name = each.value.display_name

#email of the use: 
  email        = each.value.email

# Default role assigned to the user upon login:
  default_role = each.value.default_role
}