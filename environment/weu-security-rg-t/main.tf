terraform {
  required_version = "~> 0.12.0"
  required_providers {
    azurerm = "~> 2.46.0"
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

/* Resource Group Name */
resource "azurerm_resource_group" "rg" {
    name      = "weu-security-rg-t"
    location  = var.location
    tags      = var.tags
}

resource "azurerm_key_vault" "keyvault" {
  name                = "weu-global-keyvault-t"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  tags                = var.tags
  tenant_id           = var.tenantId
  sku_name            = "standard"
  soft_delete_retention_days        = 7
  purge_protection_enabled          = false
  enabled_for_template_deployment   = true

  access_policy {
    tenant_id          = var.tenantId
    object_id          = "3ae59ba6-b5ce-4d27-96f5-fa0866ce4d16"

    key_permissions = [
      "get",
      "list",
      "delete",
      "update"
    ]
    secret_permissions = [
      "get",
      "list",
      "delete",
      "set"
    ]
    storage_permissions = [
      "get",
      "list",
      "delete",
      "set"
    ]
  }
}
