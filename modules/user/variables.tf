variable "user_definitions" {
  type = map(object({
    login_name   = string
    display_name = string
    email        = string
    default_role = string
  }))
}