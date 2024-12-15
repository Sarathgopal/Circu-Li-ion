resource "azurerm_resource_group" "rm" {
  name     = "rm-resources"
  location = "West Europe"
}

resource "azurerm_virtual_network" "rm" {
  name                = "rm-network"
  location            = azurerm_resource_group.rm.location
  resource_group_name = azurerm_resource_group.rm.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_virtual_wan" "rm" {
  name                = "rm-vwan"
  resource_group_name = azurerm_resource_group.rm.name
  location            = azurerm_resource_group.rm.location
}

resource "azurerm_virtual_hub" "rm" {
  name                = "rm-hub"
  resource_group_name = azurerm_resource_group.rm.name
  location            = azurerm_resource_group.rm.location
  virtual_wan_id      = azurerm_virtual_wan.rm.id
  address_prefix      = "10.0.1.0/24"
}

resource "azurerm_vpn_gateway" "rm" {
  name                = "rm-vpng"
  location            = azurerm_resource_group.rm.location
  resource_group_name = azurerm_resource_group.rm.name
  virtual_hub_id      = azurerm_virtual_hub.rm.id
}