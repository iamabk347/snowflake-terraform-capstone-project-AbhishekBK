# Snowflake account roles required
# for implementing Role-Based Access Control (RBAC) is created here:

terraform {
  required_providers {
    snowflake = {
      source = "snowflakedb/snowflake"
    }
  }
}

# Creating one account role for each role name provided
# in the role_names input list

resource "snowflake_account_role" "this" {
  
# Converting list of role names into a set so Terraform can create one resource per role
  for_each = toset(var.role_names)

 # Role name is derived directly from each value in the set:

  name = each.value
}