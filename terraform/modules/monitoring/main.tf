data "azurerm_monitor_workspace" "example" {
  name                = "example-workspace"
  resource_group_name = azurerm_resource_group.example.name
}

output "query_endpoint" {
  value = data.azurerm_monitor_workspace.example.query_endpoint
}