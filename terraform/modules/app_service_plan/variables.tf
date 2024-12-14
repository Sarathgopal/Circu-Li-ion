
variable "environment"{

}

variable "location"{

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


variable "resource_group_name"{
    
}


variable "tags"{
    
    
}


