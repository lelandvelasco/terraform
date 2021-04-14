variable "vmCount" {
  description = "number of VM to be create"
  default = 2
}

variable "dataDiskCount" {
  description = "number of VM to be create"
  default = 1
}

variable "nicCount" {
  description = "number of VM to be create"
  default = 1
}
variable "ipCount" {
  description = "number of VM to be create"
  default = 1
}

variable "ipAddress" {
  description = "list of ip address to be allocated"
  default = [
    "10.1.22.16",
    "10.1.22.17"
  ]
}

variable "location" {
  description = "The region where the resource is created."
  default     = "eastus2"
}

variable "tags" {
  description = "tags for the resource"
  default = {
    Department = "IT"
    serviceName = "WAF"
  }
}

variable "prefix" {
  description = "vm name prefix to be used"
  default = "delphix"
}

variable "vm_size" {
  description = "VM Size to be use"
  default = "Standard_DS1_v2"
}
variable "subnet_id" {
  description = "subnet resourced Id"
  default = "/subscriptions/a3c75f1f-98b3-458f-93c8-3131e2948b6d/resourceGroups/use2-network-rg-t/providers/Microsoft.Network/virtualNetworks/use2-network-vnet-t/subnets/test"
}

variable "keyvault" {
  description = "reference kevyault"
  default = "/subscriptions/a3c75f1f-98b3-458f-93c8-3131e2948b6d/resourceGroups/weu-security-rg-t/providers/Microsoft.KeyVault/vaults/weu-global-keyvault-t"
}

variable "adminuser"  {
  description = "default account"
  default = "adminuser"
}
