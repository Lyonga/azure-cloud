# terraform {
#   required_providers {
#     azurerm = {
#       source  = "hashicorp/azurerm"
#       version = "~> 3.0"
#     }
#   }
# }

# data "azurerm_client_config" "current" {}

# resource "terraform_data" "resource_group_dependency" {
#   input = var.resource_group_id
# }

# module "log_analytics" {
#   source  = "Umanis/log-analytics-workspace/azurerm"
#   version = "2.0.0"
#   # source  = "terraform-az-modules/log-analytics/azurerm"
#   # version = "1.0.3"

#   # Preserve the original name while making the legacy module depend on the RG ID.
#   resource_group_name        = "${var.resource_group_name}${substr(terraform_data.resource_group_dependency.output, 0, 0)}"
#   instance_index             = var.instance_index
#   custom_name                = var.custom_name
#   custom_location            = var.location
#   retention_in_days          = var.retention_in_days
#   daily_quota_gb             = var.daily_quota_gb
#   internet_ingestion_enabled = var.internet_ingestion_enabled
#   internet_query_enabled     = var.internet_query_enabled
#   # subscription_id            = var.subscription_id
#   # tenant_id                  = data.azurerm_client_config.current.tenant_id
#   custom_tags                = var.tags
# }
