variable "app_name" {
  default = "external_app01"
}

variable "app_required_resource_access" {
  description = "list API roles"
  type = list(object({
    name        = string
    description = string
    value       = string

  }))
  default = [
    {
      name        = "geographicLocation_read"
      description = "Read access for GeographicLocation API"
      value       = "GeographicLocation.Read"
    },
    {
      name        = "geographicLocation_write"
      description = "Write access for GeographicLocation API"
      value       = "GeographicLocation.Write"
    }
  ]
}