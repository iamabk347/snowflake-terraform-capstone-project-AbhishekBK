variable "environment" {
  type = string
}

variable "snowflake_account" {
  type = string
}

variable "snowflake_user" {
  type = string
}

variable "snowflake_password" {
  type      = string
  sensitive = true
}

variable "snowflake_role" {
  type = string
}

variable "snowflake_warehouse" {
  type = string
}

variable "warehouse_definitions" {
  type = map(object({
    warehouse_size = string
    auto_suspend   = number
    auto_resume    = bool
  }))
}

variable "database_definitions" {
  type = map(object({
    schemas = list(string)
  }))
}

variable "role_names" {
  type = list(string)
}

variable "user_definitions" {
  type = map(object({
    login_name   = string
    display_name = string
    email        = string
    default_role = string
  }))
}