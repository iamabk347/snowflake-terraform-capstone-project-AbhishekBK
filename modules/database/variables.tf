# Defines input structure for database and schema creation

variable "database_definitions" {

  #schemas: list of schemas to be created inside that database

  type = map(object({
    schemas = list(string)
  }))
}