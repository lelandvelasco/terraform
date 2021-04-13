/* Keyvault References */
data "azurerm_key_vault_secret" "default" {
  name            = "defaultswhkey"
  key_vault_id    = var.keyvault
}
data "azurerm_key_vault_secret" "clientID" {
  name            = "clientID"
  key_vault_id    = var.keyvault
}
data "azurerm_key_vault_secret" "clientSecret" {
  name            = "clientSecret"
  key_vault_id    = var.keyvault
}
data "azurerm_key_vault_secret" "tenantID" {
  name            = "tenantID"
  key_vault_id    = var.keyvault
}
