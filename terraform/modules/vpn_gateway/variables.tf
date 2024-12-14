variable "environment"{

}

variable "location"{
    
}
variable "resource_group_name"{
    
}


variable "tags"{
    
    
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