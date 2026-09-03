variable "admin_username" {
  description = "Administrator username for Azure VMs"
  type        = string
  default     = "azureadmin"
}

variable "admin_password" {
  description = "Administrator password for Azure VMs"
  type        = string
  sensitive   = true
}
