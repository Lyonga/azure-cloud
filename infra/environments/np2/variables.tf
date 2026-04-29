variable "location" {
  description = "Azure region override"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "function_app_name" {
  description = "Name of the function app"
  type        = string
}

variable "app_service_plan_name" {
  description = "Name of the app service plan"
  type        = string
}

variable "storage_account_name" {
  description = "Name of the storage account"
  type        = string
}

variable "storage_account_tier" {
  description = "Storage account tier"
  type        = string
}

variable "storage_replication_type" {
  description = "Storage replication type"
  type        = string
}

variable "os_type" {
  description = "OS type for function app"
  type        = string
}

variable "sku_name" {
  description = "SKU name for app service plan"
  type        = string
}

variable "runtime_stack" {
  description = "Runtime stack"
  type        = string
}

variable "runtime_version" {
  description = "Runtime version"
  type        = string
}

variable "functions_worker_runtime" {
  description = "Functions worker runtime"
  type        = string
}

variable "python_version" {
  description = "Python version"
  type        = string
}

variable "app_settings" {
  description = "App settings for function app"
  type        = map(string)
}

variable "common_tags" {
  description = "Additional tags for all resources"
  type        = map(string)
}
