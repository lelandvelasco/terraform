/* Keyvault References */
data "azurerm_key_vault_secret" "default" {
  name            = "defaultswhkey"
  key_vault_id    = var.keyvault
}
