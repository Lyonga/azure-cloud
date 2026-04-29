variable "custom_name" {
  description = "Custom name for the Log Analytics workspace."
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

variable "instance_index" {
  description = "Instance index required by the public module naming logic."
  type        = number
}

variable "retention_in_days" {
  description = "Workspace data retention in days."
  type        = number
}

variable "daily_quota_gb" {
  description = "Daily ingestion quota in GB. Use -1 for unlimited ingestion."
  type        = number
}

variable "internet_ingestion_enabled" {
  description = "Whether internet ingestion is enabled."
  type        = bool
}

variable "internet_query_enabled" {
  description = "Whether internet query is enabled."
  type        = bool
}

variable "subscription_id" {
  description = "Azure subscription ID passed to the public module."
  type        = string
}

variable "tenant_id" {
  description = "Azure tenant ID passed to the public module."
  type        = string
}

variable "tags" {
  description = "Tags to apply to resources."
  type        = map(string)
}
