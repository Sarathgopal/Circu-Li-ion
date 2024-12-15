resource "azurerm_resource_group" "rm" {
  name     = "rm-resources"
  location = "West Europe"
}

resource "azurerm_virtual_network" "rm" {
  name                = "rm-virtual-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rm.location
  resource_group_name = azurerm_resource_group.rm.name
}

resource "azurerm_subnet" "rm" {
  name                 = "rm-subnet"
  resource_group_name  = azurerm_resource_group.rm.name
  virtual_network_name = azurerm_virtual_network.rm.name
  address_prefixes     = ["10.0.1.0/24"]

  delegation {
    name = "rm-delegation"

    service_delegation {
      name    = "Microsoft.Web/serverFarms"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }
}

resource "azurerm_app_service_plan" "rm" {
  name                = "rm-app-service-plan"
  location            = azurerm_resource_group.rm.location
  resource_group_name = azurerm_resource_group.rm.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "rm" {
  name                = "rm-app-service"
  location            = azurerm_resource_group.rm.location
  resource_group_name = azurerm_resource_group.rm.name
  app_service_plan_id = azurerm_app_service_plan.rm.id
}

resource "azurerm_app_service_virtual_network_swift_connection" "rm" {
  app_service_id = azurerm_app_service.rm.id
  subnet_id      = azurerm_subnet.rm.id
}