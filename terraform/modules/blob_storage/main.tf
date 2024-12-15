resource "azurerm_resource_group" "rm" {
  name     = "rm-resources"
  location = "West Europe"
}

resource "azurerm_storage_account" "rm" {
  name                     = "rmstoracc"
  resource_group_name      = azurerm_resource_group.rm.name
  location                 = azurerm_resource_group.rm.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "rm" {
  name                  = "content"
  storage_account_name  = azurerm_storage_account.rm.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "rm" {
  name                   = "my-awesome-content.zip"
  storage_account_name   = azurerm_storage_account.rm.name
  storage_container_name = azurerm_storage_container.rm.name
  type                   = "Block"
  source                 = "some-local-file.zip"
}

resource "azurerm_private_endpoint" "recipe_storage_pe" {
  name                = "recipe-storage-pe-${var.environment}"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "recipe-storage-connection"
    is_manual_connection          = false
    private_connection_resource_id = azurerm_storage_account.recipe_storage_account.id
    subresource_names             = ["blob"]
  }

  tags = var.tags
}


resource "azurerm_private_dns_zone" "storage_dns_zone" {
  name                = "privatelink.blob.core.windows.net"
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "storage_dns_link" {
  name                  = "storage-dns-link-${var.environment}"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.storage_dns_zone.name
  virtual_network_id    = var.subnet_id
}

