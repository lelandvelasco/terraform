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

/* VM Network Interface Dynamic*/
resource "azurerm_network_interface" "nic" {
  count               = var.vmCount
  name                = "${var.prefix}-vm-${count.index}-nic"
  location            = var.location
  tags                = var.tags
  resource_group_name = azurerm_resource_group.rg.name
  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}
resource "azurerm_network_interface" "vm_static_nic" {
  count               = var.vmCount
  name                = "${var.prefix}-vm-${count.index}-nic"
  location            = var.location
  tags                = var.tags
  resource_group_name = azurerm_resource_group.rg.name
  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "static"
    private_ip_address            = azurerm_network_interface.nic.private_ip_address
  }
}
/*
resource "azurerm_virtual_machine" "vm" {
  count                 = vmCount

  name                  = "${var.prefix}-vm"
  location              = var.location
  tags                  = var.tags
  resource_group_name   = azurerm_resource_group.rg.name
  network_interface_ids = [azurerm_network_interface.nic.id]
  vm_size               = var.vm_size

  admin_ssh_key {
    username = var.username
    public_key = data.azurerm_key_vault_secret.default.value
  }

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

  os_profile_linux_config {
    disable_password_authentication = true
  }

  boot_diagnostics {
        storage_account_uri = var.storageaccount
  }
  network_interface_ids {
    azurerm_network_interface.nic.id
  }
  azurerm_availability_set {
    azurerm_availability_set.aset.id
  }
  azurerm_managed_disk {
    name          = ""
    create_option = ""
    storage_account_type
  }
}

resource "azurerm_managed_disk" "disk1" {
  name                 = "${var.prefix}-vm-disk1"
  location             = var.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 10
}
*/
