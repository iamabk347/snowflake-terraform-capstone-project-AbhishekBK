terraform {
  required_providers {
    snowflake = {
      source = "snowflakedb/snowflake"
    }
  }
}

provider "snowflake" {
  organization_name = "NOVWSPQ"
  account_name      = "MA37777"

  user     = var.snowflake_user
  password = var.snowflake_password
  role     = var.snowflake_role
}