variable "backend-tfstate" {
  type = object({
    resource_group_name   = ""
    storage_account_name  = ""
    container_name        = ""
  })
}

variable "resourceGroupName" {
  type = string
  description = "Provide Resource Group Name"
}

variable "environment" {
  type = string
  description = "Provide Environment Type: DEV, PROD"
}

variable "location" {
  type = string
  description = "Provide Resource Group Region"
}

variable "tags" {
  description = "tags for the resource"
  default = {
    Entity = ""
    Owner = ""
  }
}
