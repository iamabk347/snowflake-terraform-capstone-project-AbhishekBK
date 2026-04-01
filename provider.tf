# Establishing connection to Snowflake account using credentials provided via variables

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

# Authentication done

  user     = var.snowflake_user
  password = var.snowflake_password
  role     = var.snowflake_role
}