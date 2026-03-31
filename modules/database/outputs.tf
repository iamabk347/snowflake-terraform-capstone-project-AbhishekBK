output "database_names" {
  value = {
    for k, v in snowflake_database.this : k => v.name
  }
}