provider "azurerm" {
  features {}
}


terraform {
  required_version = ">= 1.14"

  backend "azurerm" {
    resource_group_name   = "my-terraform-backend-rg"
    storage_account_name  = "myterraformbackendstorage"
    container_name        = "terraform-state"
    key                    = "terraform.tfstate"
  }
}

# Define the environment name for the current workspace
variable "environment" {
  description = "The environment for this deployment (e.g., dev, prod)"
  type        = string
  default     = "dev"
}

variable "location" {
  description = "The Azure location to deploy resources"
  type        = string
  default     = "West Europe"
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {
    "Environment" = "dev"
    "ManagedBy"   = "Terraform"
  }
}

# Resource Group
module "resource_group" {
  source              = "./modules/resource_group"
  resource_group_name = "rg-${var.environment}"
  location            = var.location
  tags                = var.tags
}

# Virtual Network and Subnets
module "vnet" {
  source              = "./modules/networking"
  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
  environment         = var.environment
}

# VPN Gateway
module "vpn_gateway" {
  source                = "./modules/vpn_gateway"
  resource_group_name   = module.resource_group.resource_group_name
  location              = var.location
  environment           = var.environment
  local_gateway_address = var.local_gateway_address
  local_network_address_space = var.local_network_address_space
  shared_key            = var.shared_key
  tags                  = var.tags
}

# Storage Account and Blob Storage
module "storage" {
  source              = "./modules/storage"
  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
  environment         = var.environment
  tags                = var.tags
  subnet_id           = module.vnet_subnet_id
}

# CDN Endpoint
module "cdn" {
  source              = "./modules/cdn"
  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
  environment         = var.environment
  tags                = var.tags
}

# Application Insights
module "app_insights" {
  source              = "./modules/app_insights"
  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
  environment         = var.environment
  tags                = var.tags
}

# Log Analytics Workspace
module "log_analytics" {
  source              = "./modules/log_analytics"
  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
  environment         = var.environment
  tags                = var.tags
}

# Azure Functions
module "functions" {
  source              = "./modules/function"
  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
  environment         = var.environment
  tags                = var.tags
}

# Key Vault
module "keyvault" {
  source              = "./modules/keyvault"
  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
  environment         = var.environment
  tags                = var.tags
}

# App Service Plan
module "app_service_plan" {
  source              = "./modules/app_service_plan" 
  environment         = var.environment
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_tier            = var.sku_tier
  sku_size            = var.sku_size
  tags                = var.tags
}




# Application Gateway
module "app_gateway" {
  source              = "./modules/application_gateway"
  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
  environment         = var.environment
  tags                = var.tags
}


# Azure IoT Hub

module "iot_hub" {
  source              = "./modules/iot_hub"
  resource_group_name = module.resource_group.resource_group_name
  subnet_id = module.vnet_subnet_id
  location = var.location

}

# Event Grid Module
module "event_grid" {
  source                  = "./modules/event_grid"
  resource_group_name     = module.resource_group.resource_group_name
     webhook_url = "https://myapi.example.com/webhook"
  subnet_id = module.vnet_subnet_id

}


