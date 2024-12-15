data "azurerm_monitor_workspace" "rm" {
  name                = "rm-workspace"
  resource_group_name = azurerm_resource_group.rm.name
}

output "query_endpoint" {
  value = data.azurerm_monitor_workspace.rm.query_endpoint
}