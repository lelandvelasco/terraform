terraform {
  required_version = "~> 0.12.0"
  required_providers {
    azurerm = "~> 2.46.0"
  }
  backend "azurerm" {
    resource_group_name   = "weu-storage-rg-t"
    storage_account_name  = "weuterraformstate"
    container_name        = "weu"
    key                   = "usedelpx.tfstate"
  }
}

provider "azurerm" {
  features {}
}

/* Resource Group Name */
resource "azurerm_resource_group" "rg" {
    name      = "use2-${var.prefix}-rg-t"
    location  = var.location
    tags      = var.tags
}

resource "azurerm_availability_set" "aset" {
  name                = "${var.prefix}-aset"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = var.tags
}

/* VM Network Interface Static*/
resource "azurerm_network_interface" "nic" {
  for_each            = toset(var.ipConfiguration)
  name                = "${var.prefix}-vm-${each.key}-nic"
  location            = var.location
  tags                = var.tags
  resource_group_name = azurerm_resource_group.rg.name
  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Static"
    private_ip_address            = each.value
  }
}
