data "azuread_client_config" "current" {}

resource "random_string" "password" {
  length  = 33
  special = true
}

resource "azuread_application" "geolocation_api" {
  display_name    = var.app_name
  identifier_uris = ["api://${var.app_name}"]
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


resource "azuread_application_password" "geolocation_api" {
  application_object_id = azuread_application.geolocation_api.object_id
  value                 = random_string.password.result
  end_date              = "2022-01-01T01:02:03Z"
}