data "azuread_application" "geolocation_api" {
  display_name = var.app_name
}

output "account_object_id" {
  value = data.azuread_client_config.current.client_id
}

output "app_object_id" {
  value = data.azuread_application.geolocation_api.id
}

output "app_client_id" {
  value = data.azuread_application.geolocation_api.application_id
}

output "app_client_secret" {
  value     = random_string.password.result
  sensitive = false
}

output "app_details" {
  value     = {
    app_id = azuread_application.geolocation_api.application_id
    app_roles = {for idx, val in azuread_application_app_role.geolocation_api: val.display_name => val}
  }
  sensitive = false
}