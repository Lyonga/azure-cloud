terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

module "log_analytics" {
  source  = "terraform-az-modules/log-analytics/azurerm"
  version = "1.0.3"

  enabled                     = var.enabled
  custom_name                 = var.custom_name
  environment                 = var.environment
  resource_group_name         = var.resource_group_name
  location                    = var.location
  log_analytics_workspace_sku = var.log_analytics_workspace_sku
  retention_in_days           = var.retention_in_days
  daily_quota_gb              = var.daily_quota_gb
  internet_ingestion_enabled  = var.internet_ingestion_enabled
  internet_query_enabled      = var.internet_query_enabled
  diagnostic_setting_enable   = false
  resource_position_prefix    = true
  extra_tags                  = var.tags
}
