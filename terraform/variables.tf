# Environment Variables
variable "environment" {
  description = "The environment for this deployment (e.g., dev, prod)"
  type        = string
  default     = "dev"
}

# Location of resources
variable "location" {
  description = "The Azure location to deploy resources"
  type        = string
  default     = "East US"
}

# Tags to apply to resources
variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {
    "Environment" = "dev"
    "ManagedBy"   = "Terraform"
  }
}

# Resource Group Name
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "rg-${var.environment}"
}

# Virtual Network CIDR Block
variable "vnet_cidr" {
  description = "The CIDR block for the virtual network"
  type        = string
  default     = "10.0.0.0/16"
}

# Subnet CIDR Block for each subnet
variable "subnet_cidr" {
  description = "The CIDR block for the subnet in the virtual network"
  type        = string
  default     = "10.0.1.0/24"
}

# VPN Gateway Address Space
variable "vpn_gateway_ip_address" {
  description = "The public IP address for the VPN Gateway"
  type        = string
  default     = "10.0.0.4"
}

# Local Network Address Space for VPN Gateway
variable "local_network_address_space" {
  description = "The address space of the on-premises network for VPN"
  type        = list(string)
  default     = ["192.168.1.0/24"]
}

# Storage Account Settings
variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
  default     = "mystorageaccount"
}

# Container Name in Storage Account
variable "storage_container_name" {
  description = "The name of the blob container in the storage account"
  type        = string
  default     = "recipe-container"
}

# CDN Profile Name
variable "cdn_profile_name" {
  description = "The name of the Azure CDN profile"
  type        = string
  default     = "recipe-cdn-profile"
}

# App Insights Settings
variable "app_insights_name" {
  description = "The name of the Azure Application Insights resource"
  type        = string
  default     = "recipe-app-insights"
}

# Log Analytics Workspace Settings
variable "log_analytics_workspace_name" {
  description = "The name of the Log Analytics Workspace"
  type        = string
  default     = "recipe-log-analytics"
}

# Function App Settings
variable "function_app_name" {
  description = "The name of the Azure Function App"
  type        = string
  default     = "recipe-function-app"
}

# Key Vault Settings
variable "keyvault_name" {
  description = "The name of the Azure Key Vault"
  type        = string
  default     = "recipe-keyvault"
}

# Application Service Plan
variable "app_service_plan_name" {
  description = "The name of the Azure App Service Plan"
  type        = string
  default     = "recipe-app-service-plan"
}

# Application Gateway Settings
variable "gateway_name" {
  description = "The name of the Application Gateway"
  type        = string
  default     = "recipe-app-gateway"
}

# VPN Gateway Shared Key
variable "vpn_shared_key" {
  description = "The shared key for VPN gateway connection"
  type        = string
  default     = "your-shared-key"
}

# Azure AD App Registration Settings
variable "azuread_app_name" {
  description = "The name of the Azure AD application"
  type        = string
  default     = "recipe-azure-ad-app"
}

# Azure AD Application Roles
variable "azuread_roles" {
  description = "Roles for Azure AD application"
  type        = list(string)
  default     = ["User", "Admin"]
}

variable "sku_name" {
  description = "The SKU name for the Application Gateway (Standard_v2, WAF_v2)"
  type        = string
}
variable "sku_tier" {
  description = "The SKU tier for the Application Gateway (Standard_v2, WAF_v2)"
  type        = string
}
variable "sku_capacity" {
  description = "The number of Application Gateway units"
  type        = number
}
variable "subnet_id" {
  description = "The ID of the subnet where the Application Gateway will reside"
  type        = string
}
variable "public_ip_address_id" {
  description = "The ID of the public IP address for the frontend configuration"
  type        = string
}
variable "frontend_port" {
  description = "The frontend port for the Application Gateway"
  type        = number
}
variable "backend_fqdn" {
  description = "The fully qualified domain name (FQDN) for the backend servers"
  type        = string
}
variable "backend_port" {
  description = "The backend port for the Application Gateway"
  type        = number
}
variable "request_timeout" {
  description = "The request timeout for the backend servers (in seconds)"
  type        = number
}





