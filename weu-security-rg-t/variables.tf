variable "location" {
  description = "The region where the resource is created."
  default     = "westeurope"
}

variable "tags" {
  description = "tags for the resource"
  default = {
    Department = "IT"
    serviceName = "WAF"
  }
}

variable "tenantId" {
  description = "Azure AD Tenant ID"
  default = "ec92fe38-5343-4629-84b3-87e379115699"
}
