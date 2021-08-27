data "azuread_client_config" "current" {}

resource "random_string" "password" {
  length  = 33
  special = true
}

resource "azuread_application" "geolocation_api" {
  display_name    = var.app_name
  identifier_uris = ["api://${var.app_name}"]
  available_to_other_tenants = false
  oauth2_allow_implicit_flow = false
  type                       = "webapp/api"
  owners          = [data.azuread_client_config.current.object_id]
}

resource "azuread_application_app_role" "geolocation_api" {
  for_each = { for i, v in var.app_roles_apis : i => v }

  application_object_id = azuread_application.geolocation_api.object_id
  allowed_member_types  = ["Application"]
  description           = each.value.description
  display_name          = each.value.name
  is_enabled            = true
  value                 = each.value.value
}

resource "azuread_service_principal" "geolocation_api" {
  application_id               = azuread_application.geolocation_api.application_id
  app_role_assignment_required = false
  tags = [ "geolocation", "api"]
}