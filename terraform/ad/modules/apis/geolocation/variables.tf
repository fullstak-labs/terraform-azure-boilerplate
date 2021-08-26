variable "app_name" {
  default = "geolocation_api"
}

variable "resource_group_location" {
  default = "brazilsouth"
}

variable "app_roles_apis" {
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