variable "storage_account_name" {
  description = "Name of the Storage Account"
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9]{3,24}$", var.storage_account_name))
    error_message = "Storage account names must be 3-24 characters of lowercase letters and numbers."
  }
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "storage_account_tier" {
  description = "Storage account tier"
  type        = string
  default     = "Standard"
}

variable "storage_replication_type" {
  description = "Storage account replication type"
  type        = string
  default     = "LRS"
}

variable "container_access_type" {
  description = "Access level for storage containers"
  type        = string
  default     = "private"

  validation {
    condition     = contains(["private", "blob", "container"], var.container_access_type)
    error_message = "Container access type must be private, blob, or container."
  }
}

variable "container_names" {
  description = "List of blob container names to create"
  type        = list(string)
  default     = []

  validation {
    condition = alltrue([
      for name in var.container_names : can(regex("^[a-z0-9](?:[a-z0-9-]{1,61}[a-z0-9])?$", name))
    ])
    error_message = "Container names must be 3-63 characters, lowercase, and may include hyphens."
  }
}

variable "queue_names" {
  description = "List of storage queue names to create"
  type        = list(string)
  default     = []

  validation {
    condition = alltrue([
      for name in var.queue_names : can(regex("^[a-z0-9-]{3,63}$", name))
    ])
    error_message = "Queue names must be 3-63 characters, lowercase, and may include hyphens."
  }
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
