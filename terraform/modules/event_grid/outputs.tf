output "app_insights_id" {
  value = azurerm_application_insights.app_insights.id
}

output "app_insights_instrumentation_key" {
  value = azurerm_application_insights.app_insights.instrumentation_key
}
