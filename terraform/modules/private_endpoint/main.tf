data "azurerm_private_endpoint_connection" "rm" {
  name                = "rm-private-endpoint"
  resource_group_name = "rm-rg"
}

output "private_endpoint_status" {
  value = data.azurerm_private_endpoint_connection.rm.private_service_connection[0].status
}