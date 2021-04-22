/* Resource Group Name */
resource "azurerm_resource_group" "rg" {
    name      = var.resourceGroupName
    location  = var.location
    tags      = var.tags
}

/* Azure Keyvault Resource*/
resource "azurerm_key_vault" "keyvault" {
  name                = var.keyVaultName
  location            = var.location
  tags                = var.tags
  resource_group_name = var.azurerm_resource_group.rg.name
  enabled_for_deployment      = var.enabled_for_deployment
  enabled_for_template_deployment = var.enabled_for_template_deployment
  enabled_for_disk_encryption = var.enabled_for_disk_encryption
  soft_delete_retention_days  = var.soft_delete_retention_days
  purge_protection_enabled    = var.purge_protection_enabled
  sku_name            = "standard"
}

resource "azurerm_key_vault_access_policy" "access-policy" {
  for_each            = var.access_policy_list
  key_vault_id        = azurerm_key_vault.keyvault.id
  tenant_id           = var.tenant_id
  object_id           = each.value.object_id
  key_permissions     = each.value.key_permissions
  secret_permissions  = each.value.secret_permissions
  certificate_permissions = each.value.certificate_permissions
}
