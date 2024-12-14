# Output the information of deployed resources
output "vnet_id" {
  value = module.vnet.vnet_id
}

output "vpn_gateway_public_ip" {
  value = module.vpn_gateway.vpn_gateway_public_ip
}

output "storage_account_name" {
  value = module.storage.storage_account_name
}

output "cdn_endpoint_url" {
  value = module.cdn.cdn_endpoint_url
}

output "app_service_url" {
  value = module.app_service_plan.app_service_url
}

output "keyvault_uri" {
  value = module.keyvault.keyvault_uri
}

output "function_app_url" {
  value = module.functions.function_app_url
}

output "app_insights_instrumentation_key" {
  value = module.app_insights.instrumentation_key
}

output "log_analytics_workspace_id" {
  value = module.log_analytics.workspace_id
}
