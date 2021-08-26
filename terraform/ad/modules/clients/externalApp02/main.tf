terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 1.6.0"
    }
  }
}

data "azuread_client_config" "current" {}

resource "random_string" "password" {
  length  = 33
  special = true
}
resource "azuread_application" "external_app01" {
  display_name    = var.app_name
  identifier_uris = ["api://${var.app_name}"]
  owners          = [data.azuread_client_config.current.object_id]

  required_resource_access {
    resource_app_id = azuread_application.geolocation_api.application_id
    resource_access {
      id   = azuread_application_app_role.geographicLocation_read.role_id
      type = "Role"
    }
  }
}


resource "azuread_application_password" "external_app01" {
  application_object_id = azuread_application.external_app01.object_id
  value                 = random_string.password.result
  end_date              = "2022-01-01T01:02:03Z"
}