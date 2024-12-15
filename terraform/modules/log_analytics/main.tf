resource "azurerm_resource_group" "rm" {
  name     = "rm-resources"
  location = "West Europe"
}

resource "azurerm_log_analytics_workspace" "rm" {
  name                = "acctest-01"
  location            = azurerm_resource_group.rm.location
  resource_group_name = azurerm_resource_group.rm.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}