data "azuread_client_config" "current" {}

resource "random_string" "password" {
  length  = 33
  special = true
}
resource "azuread_application" "external_app01" {
  display_name    = var.app_name
  identifier_uris = ["api://${var.app_name}"]
  available_to_other_tenants = false
  oauth2_allow_implicit_flow = false
  type                       = "webapp/api"
  owners          = [data.azuread_client_config.current.object_id]

  required_resource_access {
    resource_app_id = var.app_details.app_id
    resource_access {
      id   = var.app_details.app_roles.geographicLocation_read.role_id
      type = "Role"
    }
  }
}

resource "azuread_application_password" "external_app01" {
  description           = "Managed secret key"
  application_object_id = azuread_application.external_app01.object_id
  value                 = random_string.password.result
  end_date              = "2022-01-01T01:02:03Z"
}

resource "azuread_service_principal" "external_app01" {
  application_id               = azuread_application.external_app01.application_id
  app_role_assignment_required = false
  tags = [ "external_app01", "clientApp"]
}