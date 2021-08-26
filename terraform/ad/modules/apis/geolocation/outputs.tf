data "azuread_application" "geolocation_api" {
  display_name = var.app_name
}
output "app_details" {
  value     = {
    app_object_id = azuread_application.geolocation_api.id
    client_secret = random_string.password.result
    app_id = azuread_application.geolocation_api.application_id
    app_roles = {for idx, val in azuread_application_app_role.geolocation_api: val.display_name => val}
  }
  sensitive = false
}