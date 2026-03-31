variable "warehouse_definitions" {
  type = map(object({
    warehouse_size = string
    auto_suspend   = number
    auto_resume    = bool
  }))
}