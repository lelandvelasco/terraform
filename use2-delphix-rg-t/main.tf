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

resource "azurerm_network_interface" "nic" {
  name                = "${var.prefix}-nic"
  location            = var.location
  tags                = var.tags
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Static"
    private_ip_address_version = "IPv4"
  }
}

resource "azurerm_virtual_machine" "vm" {
  name                  = "${var.prefix}-vm"
  location              = var.location
  tags                  = var.tags
  resource_group_name   = azurerm_resource_group.rg.name
  network_interface_ids = [azurerm_network_interface.nic.id]
  vm_size               = "Standard_DS1_v2"

  storage_image_reference {
    publisher = "delphix"
    offer     = "delphix_dynamic_data_platform"
    sku       = "delphix_dynamic_data_platform_5-3"
    version   = "latest"
  }

  storage_os_disk {
    name              = "${var.prefix}-vm-os"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "${var.prefix}-vm"
    admin_username = ""
    admin_password = ""
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  boot_diagnostics {
        storage_account_uri = var.storageaccount
  }
}
