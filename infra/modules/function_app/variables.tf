variable "function_app_name" {
  description = "Name of the Azure Function App"
  type        = string
}

variable "app_service_plan_name" {
  description = "Name of the App Service Plan"
  type        = string
}

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
}

variable "storage_replication_type" {
  description = "Storage account replication type"
  type        = string
}

variable "os_type" {
  description = "OS type for function app and app service plan"
  type        = string

  validation {
    condition     = var.os_type == "Linux"
    error_message = "This module is configured for Linux Function Apps only."
  }
}

variable "sku_name" {
  description = "SKU name for App Service Plan"
  type        = string
}

variable "runtime_stack" {
  description = "The runtime stack"
  type        = string

  validation {
    condition     = lower(var.runtime_stack) == "python"
    error_message = "This module currently supports the Python runtime stack only."
  }
}

variable "runtime_version" {
  description = "The runtime version"
  type        = string
}

variable "functions_worker_runtime" {
  description = "The Functions worker runtime"
  type        = string
}

variable "python_version" {
  description = "Python version"
  type        = string
}

variable "app_settings" {
  description = "App settings for the function app"
  type        = map(string)
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
}
