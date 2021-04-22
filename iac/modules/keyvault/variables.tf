variable "backend-tfstate" {
  default = {}
  type = map(object({
    resource_group_name   = string
    storage_account_name  = string
    container_name        = string
  }))
  description = "Backend Terraform State"
}

variable "tags" {
  description = "tags for the resource"
  default = {}
}

variable "resourceGroupName" {
  default     = ""
  Type        = string
  description = "Provide Resource Group Name"
}

variable "keyVaultName" {
  default     = ""
  Type        = string
  description = "Provide Environment Type: DEV, PROD"
}

variable "location" {
  default     = ""
  Type        = string
  description = "Provide Resource Group Region"
}

variable "enabled_for_disk_encryption" {
  default     = false
  Type        = bool
  description = "Enable this keyvault for disk encryption"
}

variable "enabled_for_disk_encryption" {
  default     = false
  Type        = bool
  description = "Enable this keyvault for Azure Deployment"
}

variable "enabled_for_disk_encryption" {
  default     = false
  Type        = bool
  description = "Enable this keyvault for Azure Template Deployment"
}

variable "soft_delete_retention_days" {
  default     = 7
  Type        = number
  description = "Enable this keyvault for disk encryption"
}

variable "purge_protection_enabled" {
  default     = true
  Type        = bool
  description = "Enable this keyvault for disk encryption"
}

variable "tenant_id {
  default = ""
  Type = string
  description = "Azure AD tenant ID"
}

variable "access_policy_list" {
  default = {}
  type = map(object({
    object_id                      = string
    key_permissions                = list(string)
    secret_permissions             = list(string)
  }))
  description = "Provide objectID, key certifcate and secret permission"
}
