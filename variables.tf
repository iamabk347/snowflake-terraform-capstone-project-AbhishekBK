# Global Variables Definition:
# all input variables used across modules are being defined here.

# Environment (dev / qa / prod)

variable "environment" {
  type = string
}

# Snowflake account identifier added:

variable "snowflake_account" {
  type = string
}

# Snowflake username defined:

variable "snowflake_user" {
  type = string
}

# Snowflake password added(condition set to true as value sensitive for security)

variable "snowflake_password" {
  type      = string
  sensitive = true
}

# Role used by Terraform to execute operations:

variable "snowflake_role" {
  type = string
}

# Default warehous:

variable "snowflake_warehouse" {
  type = string
}

# Warehouse Definitions:
# Defining multiple warehouses with configuration
# Used by warehouse module with "for_each"

variable "warehouse_definitions" {
  type = map(object({
    warehouse_size = string
    auto_suspend   = number
    auto_resume    = bool
  }))
}

# Database Definitions:
# Defined databases and their corresponding schemas
# Used by database module to dynamically create resources

variable "database_definitions" {
  type = map(object({
    schemas = list(string)
  }))
}

# List of roles to be created in Snowflke is being defined:

variable "role_names" {
  type = list(string)
}

# user attributes and default roles are defined here.
# Used by user module to create Snowflake users

variable "user_definitions" {
  type = map(object({
    login_name   = string
    display_name = string
    email        = string
    default_role = string
  }))
}