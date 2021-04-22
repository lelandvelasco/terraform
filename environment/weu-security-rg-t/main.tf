module "keyvault" {
  source = "./terraform/modules/keyvault/"
  backend-tfstate {
    resource_group_name   = "weu-storage-rg-t"
    storage_account_name  = "weuterraformstate"
    container_name        = "weu"
  }
  tags {
    Entity = "Test"
    Owner  = "Leland Velasco"
  }
  resourceGroupName = "weu-security-rg-t"
  keyVaultName      = "weu-global-keyvault-t"
  location          = "westeurope"
  enabled_for_disk_encryption = false
  enabled_for_disk_encryption = false
  enabled_for_disk_encryptio  = false
  soft_delete_retention_days  = 7
  purge_protection_enabled    = true
  tenant_id = "ec92fe38-5343-4629-84b3-87e379115699"

  access_policy_list = [
    {
      object_id = "3ae59ba6-b5ce-4d27-96f5-fa0866ce4d16"
      key_permissions = ["get","list","delete","update"]
      secret_permissions = ["get","list","delete","set"]
      storage_permissions = ["get","list","delete","set"]
    }
  ]
}
