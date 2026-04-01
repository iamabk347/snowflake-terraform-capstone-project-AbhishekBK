# this module Defines structure for creating Snowflake users:

variable "user_definitions" {

  # Each user entry contains:
  # login_name: unique identifier for login
  # display_name: readable name
  # email:user email
  # default_role: role assigned by default

  type = map(object({
    login_name   = string
    display_name = string
    email        = string
    default_role = string
  }))
}