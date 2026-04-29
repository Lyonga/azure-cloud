variable "azure_tenant_id" {
  description = "Azure tenant ID used by the provider. Override per workspace if needed."
  type        = string
  default     = "79dd759b-3fbe-4ab1-9439-ff87b14ba8f2"
}

variable "location" {
  description = "Azure region override"
  type        = string
  default     = null
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = null
}

variable "function_app_name" {
  description = "Name of the function app"
  type        = string
  default     = null
}

variable "app_service_plan_name" {
  description = "Name of the app service plan"
  type        = string
  default     = null
}

variable "storage_account_name" {
  description = "Name of the storage account"
  type        = string
  default     = null
}

variable "storage_account_tier" {
  description = "Storage account tier"
  type        = string
  default     = "Standard"
}

variable "storage_replication_type" {
  description = "Storage replication type"
  type        = string
  default     = "LRS"
}

variable "os_type" {
  description = "OS type for function app"
  type        = string
  default     = "Linux"
}

variable "sku_name" {
  description = "SKU name for app service plan"
  type        = string
  default     = "B1"
}

variable "runtime_stack" {
  description = "Runtime stack"
  type        = string
  default     = "python"
}

variable "runtime_version" {
  description = "Runtime version"
  type        = string
  default     = "3.11"
}

variable "functions_worker_runtime" {
  description = "Functions worker runtime"
  type        = string
  default     = "python"
}

variable "python_version" {
  description = "Python version"
  type        = string
  default     = "3.11"
}

variable "app_settings" {
  description = "App settings for function app"
  type        = map(string)
  default     = {}
}

variable "common_tags" {
  description = "Additional tags for all resources"
  type        = map(string)
  default     = {}
}

variable "enable_shared_storage_messaging" {
  description = "Whether to deploy the shared storage account, containers, and queues."
  type        = bool
  default     = false
}

variable "shared_storage_account_name" {
  description = "Storage account name for the shared storage module."
  type        = string
  default     = null
}

variable "shared_storage_account_tier" {
  description = "Storage account tier for the shared storage module."
  type        = string
  default     = "Standard"
}

variable "shared_storage_replication_type" {
  description = "Storage replication type for the shared storage module."
  type        = string
  default     = "LRS"
}

variable "shared_container_access_type" {
  description = "Blob container access type for the shared storage module."
  type        = string
  default     = "private"
}

variable "shared_container_names" {
  description = "Blob container names for the shared storage module."
  type        = list(string)
  default     = []
}

variable "shared_queue_names" {
  description = "Queue names for the shared storage module."
  type        = list(string)
  default     = []
}
