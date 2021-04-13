terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.46.0"
    }
  }
}

/* Resource Group Name */
resource "azurerm_resource_group" "rg" {
    name      = "weu-security-rg-t"
    location  = var.location
    tags      = var.tags
}

provider "azurerm" {
  features {}
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
