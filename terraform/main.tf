terraform {
  required_version = "~> 0.12.0"
  required_providers {
    azurerm = "~> 2.11.0"
  }
  backend "azurerm" {
    resource_group_name   = "weu-storage-rg-t"
    storage_account_name  = "weuterraformstate"
    container_name        = "weu"
    key                   = "weuvnet2t.tfstate"
  }
}

provider "azurerm" {
  features {}
}
#Create Resource Group
resource "azurerm_resource_group" "tamops" {
  name     = "weu-vnet2-rg-t"
  location = "westeurope"
}
