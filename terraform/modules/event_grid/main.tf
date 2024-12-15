resource "azurerm_eventgrid_topic" "rm" {
  name                = "my-event-grid-topic"
  location            = "EastWest Europe"
  resource_group_name = var.resource_group_name
}

resource "azurerm_eventgrid_event_subscription" "rm" {
  name                 = "my-event-grid-subscription"
  scope = "/subscriptions/${data.azurerm_client_config.current.subscription_id}"
  webhook_endpoint {
    url = var.webhook_url
    
  }

  event_delivery_schema = "EventGridSchema"
}

resource "azurerm_private_endpoint" "event_grid_private_endpoint" {
  name                = "my-event-grid-private-endpoint"
  location            = azurerm_eventgrid_topic.rm.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "my-event-grid-connection"
    private_connection_resource_id = azurerm_eventgrid_topic.rm.id
    subresource_names              = ["eventgrid"]
    is_manual_connection = false
  }
}

resource "azurerm_private_dns_zone" "event_grid_dns_zone" {
  name                = "privatelink.eventgrid.azure.net"
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_a_record" "event_grid_dns_record" {
  name                = "my-event-grid"
  zone_name           = azurerm_private_dns_zone.event_grid_dns_zone.name
  resource_group_name = var.resource_group_name
  ttl                 = 300
  records             = [azurerm_private_endpoint.event_grid_private_endpoint.private_ip_address]
}
