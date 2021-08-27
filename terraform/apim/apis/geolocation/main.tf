resource "azurerm_api_management_api" "geographicLocation-api" {
  name                = var.api_name
  resource_group_name = var.resource_group_name
  api_management_name = var.apim_name
  revision            = "2"
  display_name        = var.api_display_name
  path                = var.api_path
  protocols           = ["https"]

  import {
    content_format = "swagger-link-json"
    # file(abspath("api-management/apis/download-public-api.json"))
    content_value  = "https://raw.githubusercontent.com/fullstak-labs/terraform-azure-boilerplate/main/swagger/GeographicLocation.swagger.json"
  }
}