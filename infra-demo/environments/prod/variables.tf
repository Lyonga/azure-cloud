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
  default     = "GRS"
}

variable "os_type" {
  description = "OS type for function app"
  type        = string
  default     = "Linux"
}

variable "sku_name" {
  description = "SKU name for app service plan"
  type        = string
  default     = "P1V2"
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
