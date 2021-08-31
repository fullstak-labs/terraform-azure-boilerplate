resource "azurerm_api_management_api_operation_policy" "geographicLocation-api" {
  api_name            = azurerm_api_management_api_operation.geographicLocationTest.api_name
  api_management_name = azurerm_api_management_api_operation.geographicLocationTest.api_management_name
  resource_group_name = azurerm_api_management_api_operation.geographicLocationTest.resource_group_name
  operation_id        = azurerm_api_management_api_operation.geographicLocationTest.operation_id

  xml_content = <<XML
<policies>
  <inbound>
    <find-and-replace from="xyz" to="abc" />
  </inbound>
</policies>
XML

}