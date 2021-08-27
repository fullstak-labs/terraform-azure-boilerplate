resource "azurerm_api_management_api" "geographicLocation-api" {
  name                = var.api_name
  resource_group_name = var.resource_group_name
  api_management_name = var.apim_name
  revision            = "1"
  display_name        = var.api_display_name
  path                = var.api_path
  protocols           = ["https"]

  import {
    content_format = "swagger-link-json"
    content_value  = "./swagger/GeographicLocation.swagger.json"
  }
}