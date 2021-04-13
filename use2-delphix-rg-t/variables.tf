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

variable "subnet_id" {
  description = "subnet resourced Id"
  default = ""
}
