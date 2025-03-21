resource "azurerm_application_insights" "app_insights" {
  name                = "recipe-app-insights-${var.environment}"
  location            = var.location
  resource_group_name = var.resource_group_name
  application_type    = "web"

  tags = var.tags
}

