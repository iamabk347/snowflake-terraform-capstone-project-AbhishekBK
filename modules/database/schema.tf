resource "snowflake_schema" "this" {
  for_each = merge([
    for db_name, db in var.database_definitions : {
      for schema in db.schemas : "${db_name}.${schema}" => {
        database = db_name
        schema   = schema
      }
    }
  ]...)

  database = upper(each.value.database)
  name     = upper(each.value.schema)
}