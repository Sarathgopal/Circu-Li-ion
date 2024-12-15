resource "azurerm_resource_group" "rm" {
  name     = "rm-resources"
  location = "West Europe"
}

resource "azurerm_cdn_profile" "rm" {
  name                = "rmCdnProfile"
  location            = azurerm_resource_group.rm.location
  resource_group_name = azurerm_resource_group.rm.name
  sku                 = "Standard_Verizon"

  tags = {
    environment = "Production"
    cost_center = "MSFT"
  }
}