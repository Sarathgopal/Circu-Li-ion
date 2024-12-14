terraform {
  backend "azurerm" {
    resource_group_name   = "terraform-backend"
    storage_account_name  = "tfstatestorage${terraform.workspace}"
    container_name        = "tfstate"
    key                   = "terraform.tfstate"
  }
}
