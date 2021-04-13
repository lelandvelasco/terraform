terraform {
  backend "azurerm" {
    resource_group_name   = "weu-storage-rg-t"
    storage_account_name  = "weuterraformstate"
    container_name        = "azurerm"
    key                   = "weukeyvaultrgt.tfstate"
  }
}
