variable "database_definitions" {
  type = map(object({
    schemas = list(string)
  }))
}