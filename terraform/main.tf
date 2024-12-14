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
  local_gateway_address = "1.2.3.4"  # Example IP of your on-premises VPN Gateway
  local_network_address_space = ["10.0.0.0/24"]  # Example local network space
  shared_key            = "your-shared-key"
  tags                  = var.tags
}

# Storage Account and Blob Storage
module "storage" {
  source              = "./modules/storage"
  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
  environment         = var.environment
  tags                = var.tags
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
  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
  environment         = var.environment
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

