output "vnet_id" {
  description = "The ID of the virtual network"
  value       = azurerm_virtual_network.recipe_vnet.id
}

output "subnet_ids" {
  description = "The IDs of the subnets in the virtual network"
  value       = azurerm_subnet.recipe_subnet[*].id
}

output "vpn_gateway_public_ip" {
  description = "The public IP address of the VPN gateway"
  value       = azurerm_public_ip.recipe_vpn_gateway_ip.ip_address
}

output "storage_account_name" {
  description = "The name of the Azure storage account"
  value       = azurerm_storage_account.recipe_storage_account.name
}

output "blob_container_url" {
  description = "The URL of the blob container"
  value       = "https://${azurerm_storage_account.recipe_storage_account.name}.blob.core.windows.net/${azurerm_storage_container.recipe_blob_container.name}"
}

output "cdn_endpoint_url" {
  description = "The URL of the Azure CDN endpoint"
  value       = azurerm_cdn_endpoint.recipe_cdn_endpoint.host_name
}

output "app_service_plan_id" {
  description = "The ID of the App Service Plan"
  value       = azurerm_app_service_plan.recipe_app_service_plan.id
}

output "app_service_url" {
  description = "The URL of the App Service"
  value       = azurerm_app_service.recipe_app_service.default_site_hostname
}

output "keyvault_uri" {
  description = "The URI of the Azure Key Vault"
  value       = azurerm_key_vault.recipe_keyvault.vault_uri
}

output "function_app_url" {
  description = "The URL of the Azure Function App"
  value       = azurerm_function_app.recipe_function_app.default_site_hostname
}

output "azure_monitor_workspace_id" {
  description = "The ID of the Azure Monitor Log Analytics workspace"
  value       = azurerm_log_analytics_workspace.recipe_log_analytics_workspace.id
}

output "app_insights_instrumentation_key" {
  description = "The instrumentation key for Application Insights"
  value       = azurerm_application_insights.recipe_app_insights.instrumentation_key
}

output "private_endpoint_ids" {
  description = "The IDs of the private endpoints"
  value       = azurerm_private_endpoint.recipe_private_endpoint[*].id
}
