variable "enabled" {
  description = "Whether to deploy the Log Analytics workspace."
  type        = bool
  default     = true
}

variable "custom_name" {
  description = "Custom suffix used by the public module. The upstream module prefixes the final resource with law-."
  type        = string
}

variable "environment" {
  description = "Environment label for the public module."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group."
  type        = string
}

variable "location" {
  description = "Azure region."
  type        = string
}

variable "log_analytics_workspace_sku" {
  description = "SKU for the Log Analytics workspace."
  type        = string
  default     = "PerGB2018"
}

variable "retention_in_days" {
  description = "Workspace data retention in days."
  type        = number
  default     = 30
}

variable "daily_quota_gb" {
  description = "Daily ingestion quota in GB. Use -1 for unlimited ingestion."
  type        = string
  default     = "1"
}

variable "internet_ingestion_enabled" {
  description = "Whether internet ingestion is enabled."
  type        = bool
  default     = true
}

variable "internet_query_enabled" {
  description = "Whether internet query is enabled."
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags to apply to resources."
  type        = map(string)
  default     = {}
}
