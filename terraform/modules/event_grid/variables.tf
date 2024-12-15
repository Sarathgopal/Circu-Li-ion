variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "subnet_id" {
  description = "The subnet ID for the private endpoint."
  type        = string
}

variable "webhook_url" {
  description = "The webhook URL to send event notifications."
  type        = string
}
