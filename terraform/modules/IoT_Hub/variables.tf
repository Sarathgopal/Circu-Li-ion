variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "subnet_id" {
  description = "The subnet ID for the private endpoint."
  type        = string
}

variable "location"{

}

variable "service_connection" {
  default = "Iot service_connection"
  type    = string
}