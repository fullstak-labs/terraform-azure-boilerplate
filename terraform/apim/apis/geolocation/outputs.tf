data "azurerm_api_management_api" "geographicLocation-api" {
  name                = var.api_name
  resource_group_name = var.resource_group_name
  api_management_name = var.apim_name
  revision            = "1"

  depends_on = [
    azurerm_api_management_api.geographicLocation-api
  ]
}

output "geolocation_api_output" {
  value = data.azurerm_api_management_api.geographicLocation-api
}