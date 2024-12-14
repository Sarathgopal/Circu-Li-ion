data "azurerm_private_endpoint_connection" "example" {
  name                = "example-private-endpoint"
  resource_group_name = "example-rg"
}

output "private_endpoint_status" {
  value = data.azurerm_private_endpoint_connection.example.private_service_connection[0].status
}