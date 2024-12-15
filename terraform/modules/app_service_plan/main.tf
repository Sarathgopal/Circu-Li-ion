resource "azurerm_app_service_plan" "app_service_plan" {
  name                = "recipe-app-service-plan-${var.environment}"
  location            = var.location
  resource_group_name = var.resource_group_name
  kind                = "Linux" 
  reserved            = true

  sku {
    tier = var.sku_tier
    size = var.sku_size
  }

  tags = var.tags
}

