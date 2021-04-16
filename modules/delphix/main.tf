terraform {
  required_version = "~> 0.12.0"
  required_providers {
    azurerm = "~> 2.46.0"
  }
  backend "azurerm" {
    resource_group_name   = var.backend-tfstate.resource_group_name
    storage_account_name  = var.backend-tfstate.storage_account_name
    container_name        = var.backend-tfstate.container_name
    key                   = "${var.environment}/${var.resourceGroupName}.tfstate"
  }
}

provider "azurerm" {
  features {}
}

/* Resource Group Name */
resource "azurerm_resource_group" "rg" {
    name      = var.resourceGroupName
    location  = var.location.regionName
    tags      = var.tags
}

/* Create Availability Set */
resource "azurerm_availability_set" "aset" {
  name                = "${var.prefix}-aset"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = var.tags
  platform_update_domain_count  = 5
  platform_fault_domain_count   = 3
}
