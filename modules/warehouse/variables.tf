# Warehouse Module Variables
# Defines input structure for warehouse creation:

variable "warehouse_definitions" {
  

  # Each warehouse will have:
  # - warehouse_size: size of compute (XSMALL, SMALL, etc.)
  # - auto_suspend: time in seconds before auto suspend
  # - auto_resume:  whether warehouse resumes automatically

  type = map(object({
    warehouse_size = string
    auto_suspend   = number
    auto_resume    = bool
  }))
}