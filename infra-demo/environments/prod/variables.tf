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

variable "enable_shared_storage_messaging" {
  description = "Whether to deploy the shared storage account, containers, and queues."
  type        = bool
}

variable "shared_storage_account_name" {
  description = "Storage account name for the shared storage module."
  type        = string
}

variable "shared_storage_account_tier" {
  description = "Storage account tier for the shared storage module."
  type        = string
}

variable "shared_storage_replication_type" {
  description = "Storage replication type for the shared storage module."
  type        = string
}

variable "shared_container_access_type" {
  description = "Blob container access type for the shared storage module."
  type        = string
}

variable "shared_container_names" {
  description = "Blob container names for the shared storage module."
  type        = list(string)
}

variable "shared_queue_names" {
  description = "Queue names for the shared storage module."
  type        = list(string)
}

variable "shared_log_analytics_custom_name" {
  description = "Custom name suffix for the public Log Analytics module."
  type        = string
}

variable "shared_log_analytics_instance_index" {
  description = "Instance index for the public Log Analytics module."
  type        = number
}

variable "shared_log_analytics_retention_in_days" {
  description = "Retention period in days for the shared Log Analytics workspace."
  type        = number
}

variable "shared_log_analytics_daily_quota_gb" {
  description = "Daily quota in GB for the shared Log Analytics workspace."
  type        = number
}

variable "shared_log_analytics_internet_ingestion_enabled" {
  description = "Whether to allow internet ingestion for the shared Log Analytics workspace."
  type        = bool
}

variable "shared_log_analytics_internet_query_enabled" {
  description = "Whether to allow internet query access for the shared Log Analytics workspace."
  type        = bool
}
