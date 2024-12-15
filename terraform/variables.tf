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
  default     = "West Europe"
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

variable "sku_tier" {
  description = "The performance tier of the storage account (Standard or Premium)"
  type        = string
  default     = "Standard"  # Default to Standard
}

variable "sku_size" {
  description = "The replication type of the storage account (LRS, ZRS, GRS, RA-GRS)"
  type        = string
  default     = "LRS"  # Default to Locally Redundant Storage
}
variable "local_gateway_address" {
  description = "The IP address of the on-premises local gateway"
  type        = string
}

variable "local_network_address_space" {
  description = "The address space of the on-premises local network"
  type        = list(string)
}

variable "shared_key" {
  description = "Shared key for the VPN connection"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region where resources will be deployed"
  type        = string
}

variable "virtual_network_name" {
  description = "The name of the virtual network"
  type        = string
}

variable "virtual_network_address_space" {
  description = "The address space of the virtual network"
  type        = list(string)
}

variable "firewall_subnet_address_prefix" {
  description = "The address prefix for the firewall subnet"
  type        = list(string)
}

variable "public_ip_name" {
  description = "The name for the public IP"
  type        = string
}

variable "firewall_name" {
  description = "The name for the Azure Firewall"
  type        = string
}
