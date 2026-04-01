# dynamically creates schemas inside each database
# based on the nested structure defined in database_definitions


# Creating one schema resource for every schema listed under
# every database in the input map

resource "snowflake_schema" "this" {


  # Since Terraform cannot directly loop over nested maps/lists
  # in a resource block, so we transform that nested structure
  # into a flat map using:
  # outer loop: database
  # inner loop: schema inside that database
  # merge to combine all generated maps into one

  for_each = merge([
    for db_name, db in var.database_definitions : {
      for schema in db.schemas : "${db_name}.${schema}" => {
        database = db_name
        schema   = schema
      }
    }
  ]...)

# Database name converted to uppercase for Snowflake consistency

  database = upper(each.value.database)

# Schema name converted to uppercase for Snowflake consistency:

  name     = upper(each.value.schema)
}