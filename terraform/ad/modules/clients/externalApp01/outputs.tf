
data "azuread_application" "external_app01" {
  display_name = var.app_name
}
output "app_details" {
  value     = {
    app_object_id = azuread_application.external_app01.id
    client_secret = random_string.password.result
    app_id = azuread_application.external_app01.application_id
  }
  sensitive = false
}