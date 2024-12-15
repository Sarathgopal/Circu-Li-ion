resource "azurerm_resource_group" "rm" {
  name     = "azure-functions-test-rg"
  location = "West Europe"
}

resource "azurerm_storage_account" "rm" {
  name                     = "functionsapptestsa"
  resource_group_name      = azurerm_resource_group.rm.name
  location                 = azurerm_resource_group.rm.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_app_service_plan" "rm" {
  name                = "azure-functions-test-service-plan"
  location            = azurerm_resource_group.rm.location
  resource_group_name = azurerm_resource_group.rm.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_function_app" "rm" {
  name                       = "test-azure-functions"
  location                   = azurerm_resource_group.rm.location
  resource_group_name        = azurerm_resource_group.rm.name
  app_service_plan_id        = azurerm_app_service_plan.rm.id
  storage_account_name       = azurerm_storage_account.rm.name
  storage_account_access_key = azurerm_storage_account.rm.primary_access_key
}