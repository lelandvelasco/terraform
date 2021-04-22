terraform {
  required_version = "~> 0.12.0"
  required_providers {
    azurerm = "~> 2.46.0"
  }
  backend "azurerm" {
    resource_group_name   = var.backend-tfstate.resource_group_name
    storage_account_name  = var.backend-tfstate.storage_account_name
    container_name        = var.backend-tfstate.container_name
    key                   = "${var.resourceGroupName}.tfstate"
  }
}

provider "azurerm" {
  features {}
}
