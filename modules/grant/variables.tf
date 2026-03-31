variable "role_names" {
  type = list(string)
}

variable "warehouse_name" {
  type = string
}

variable "database_names" {
  type = map(string)
}

variable "role_for_db" {
  type = string
}

variable "user_role_map" {
  type = map(string)
}