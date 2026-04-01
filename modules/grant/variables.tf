# These variables control which roles receive which
# privileges and how users are mapped to roles

# List of Snowflake roles that should receive warehouse access:

variable "role_names" {
  type = list(string)
}

# Warehouse on which usage privilege will be granted:
variable "warehouse_name" {
  type = string
}



# List of database names to which privileges will be granted:
variable "database_names" {
  type = map(string)
}


# Role that should receive database and schema access:
variable "role_for_db" {
  type = string
}


# Mapping of users to roles:
variable "user_role_map" {
  type = map(string)
}