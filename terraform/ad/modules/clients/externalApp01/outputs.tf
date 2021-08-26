
data "azuread_application" "external_app01" {
  display_name = var.app_name
}

output "account_object_id" {
  value = data.azuread_client_config.current.client_id
}

output "app_object_id" {
  value = data.azuread_application.external_app01.id
}

output "app_client_id" {
  value = data.azuread_application.external_app01.application_id
}

output "app_client_secret" {
  value     = random_string.password.result
  sensitive = false
}