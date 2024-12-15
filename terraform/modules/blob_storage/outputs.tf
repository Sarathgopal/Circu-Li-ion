
output "storage_account_id" {
  value = azurerm_storage_account.recipe_storage_account.id
}

output "storage_account_name" {
  value = azurerm_storage_account.recipe_storage_account.name
}

output "storage_container_name" {
  value = azurerm_storage_container.recipe_container.name
}

output "private_endpoint_id" {
  value = azurerm_private_endpoint.recipe_storage_pe.id
}
