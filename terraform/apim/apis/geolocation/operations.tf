resource "azurerm_api_management_api_operation" "geographicLocationTest" {
  operation_id        = "geographicLocationTest"
  api_name            = data.azurerm_api_management_api.geographicLocation-api.name
  api_management_name = data.azurerm_api_management_api.geographicLocation-api.api_management_name
  resource_group_name = data.azurerm_api_management_api.geographicLocation-api.resource_group_name
  display_name        = "List Tests"
  method              = "GET"
  url_template        = "/test"
  description         = "This operation list tests."

  response {
    status_code = 200
  }

  depends_on = [
    azurerm_api_management_api.geographicLocation-api
  ]
}