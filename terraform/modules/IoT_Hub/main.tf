
resource "azurerm_iot_hub" "rm" {
  name                = "my-iot-hub"
  location            = "EastWest Europe"
  resource_group_name = var.resource_group_name
  sku {
    name     = "S1"  # Choose your IoT Hub SKU (e.g., B1, S1, etc.)
    capacity = 1
  }

  tags = {
    environment = "production"
  }

  properties {
    enable_file_upload_notifications = true
  }
}

resource "azurerm_private_endpoint" "iot_hub_private_endpoint" {
  name                = "my-iot-hub-private-endpoint"
  location            = azurerm_iot_hub.rm.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = var.service_connection
    private_connection_resource_id = azurerm_iot_hub.rm.id
    subresource_names              = ["iotHub"]
    is_manual_connection = true
  }
}

resource "azurerm_private_dns_zone" "iot_hub_dns_zone" {
  name                = "privatelink.azure-devices.net"
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_a_record" "iot_hub_dns_record" {
  name                = "my-iot-hub"
  zone_name           = azurerm_private_dns_zone.iot_hub_dns_zone.name
  resource_group_name = var.resource_group_name
  ttl                 = 300
  records             = [azurerm_private_endpoint.iot_hub_private_endpoint.private_ip_address]
}
