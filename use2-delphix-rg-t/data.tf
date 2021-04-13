/* Keyvault References */
data "azurerm_key_vault_secret" "default" {
  name            = "defaultswhkey"
  key_vault_id    = var.keyvault
}
data "azurerm_key_vault_secret" "default" {
  name            = "clientID"
  key_vault_id    = var.keyvault
}
data "azurerm_key_vault_secret" "default" {
  name            = "clientSecret"
  key_vault_id    = var.keyvault
}
data "azurerm_key_vault_secret" "default" {
  name            = "tenantID"
  key_vault_id    = var.keyvault
}
