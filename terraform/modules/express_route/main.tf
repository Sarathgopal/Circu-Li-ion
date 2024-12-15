resource "azurerm_resource_group" "rm" {
  name     = "exprtTest"
  location = "West Europe"
}

resource "azurerm_express_route_circuit" "rm" {
  name                  = "expressRoute1"
  resource_group_name   = azurerm_resource_group.rm.name
  location              = azurerm_resource_group.rm.location
  service_provider_name = "Equinix"
  peering_location      = "Silicon Valley"
  bandwidth_in_mbps     = 50

  sku {
    tier   = "Standard"
    family = "MeteredData"
  }

  tags = {
    environment = "Production"
  }
}