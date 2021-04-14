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
/* NIC Static IP Loop */
locals {
  vm_datadiskdisk_count_map = { for k in toset(var.ipAddress) : k => var.ipCount }
  luns                      = { for k in local.datadisk_lun_map : k.datadisk_name => k.lun }
  datadisk_lun_map = flatten([
    for vm_name, count in local.vm_datadiskdisk_count_map : [
      for i in range(count) : {
        datadisk_name = format(vm_name, i)
        lun           = i
      }
    ]
  ])
}

/* VM Network Interface Dynamic*/

