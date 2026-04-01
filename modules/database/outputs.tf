
#provides created database names to other modules

output "database_names" {
  
#all database names from the resource block are collected: 

  value = {
    for k, v in snowflake_database.this : k => v.name
  }
}