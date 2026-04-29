locals {
  environment                    = "prod"
  subscription_id                = "ce792f64-9e63-483b-8136-a2538b764f3d"
  subscription_scope             = "prod"
  default_location               = "eastus"
  workspace_name                 = terraform.workspace == "default" ? "demo-infra-prod" : terraform.workspace
  resolved_location              = coalesce(var.location, local.default_location)
  default_resource_group_name    = "rg-lyonga-azure-prod-eus-01"
  default_function_app_name      = "func-lyonga-azure-prod-eus-01"
  default_app_service_plan_name  = "asp-lyonga-azure-prod-eus-01"
  default_storage_account_name   = "stlyongaazprodeus01"
  resolved_resource_group_name   = coalesce(var.resource_group_name, local.default_resource_group_name)
  resolved_function_app_name     = coalesce(var.function_app_name, local.default_function_app_name)
  resolved_app_service_plan_name = coalesce(var.app_service_plan_name, local.default_app_service_plan_name)
  resolved_storage_account_name  = coalesce(var.storage_account_name, local.default_storage_account_name)
  resolved_tags = merge(
    {
      Environment        = local.environment
      ManagedBy          = "Terraform"
      Project            = "azure-cloud"
      SubscriptionScope  = local.subscription_scope
      TerraformWorkspace = local.workspace_name
    },
    var.common_tags
  )
  resolved_app_settings = merge(
    {
      ENVIRONMENT = local.environment
    },
    var.app_settings
  )
}

module "resource_group" {
  source = "../../modules/resource_group"

  resource_group_name = local.resolved_resource_group_name
  location            = local.resolved_location
  tags                = local.resolved_tags
}

module "function_app" {
  source = "../../modules/function_app"

  function_app_name        = local.resolved_function_app_name
  app_service_plan_name    = local.resolved_app_service_plan_name
  storage_account_name     = local.resolved_storage_account_name
  resource_group_name      = module.resource_group.name
  location                 = local.resolved_location
  storage_account_tier     = var.storage_account_tier
  storage_replication_type = var.storage_replication_type
  os_type                  = var.os_type
  sku_name                 = var.sku_name
  runtime_stack            = var.runtime_stack
  runtime_version          = var.runtime_version
  functions_worker_runtime = var.functions_worker_runtime
  python_version           = var.python_version
  app_settings             = local.resolved_app_settings
  tags                     = local.resolved_tags

  depends_on = [module.resource_group]
}

module "storage_messaging" {
  count  = var.enable_shared_storage_messaging ? 1 : 0
  source = "../../modules/storage_messaging"

  storage_account_name     = var.shared_storage_account_name
  resource_group_name      = module.resource_group.name
  location                 = local.resolved_location
  storage_account_tier     = var.shared_storage_account_tier
  storage_replication_type = var.shared_storage_replication_type
  container_access_type    = var.shared_container_access_type
  container_names          = var.shared_container_names
  queue_names              = var.shared_queue_names
  tags                     = local.resolved_tags

  depends_on = [module.resource_group]
}

module "log_analytics_public" {
  source = "../../modules/log_analytics_public"

  custom_name         = var.shared_log_analytics_custom_name
  resource_group_name = module.resource_group.name
  location            = local.resolved_location
  retention_in_days   = var.shared_log_analytics_retention_in_days
  daily_quota_gb      = var.shared_log_analytics_daily_quota_gb
  subscription_id     = local.subscription_id
  tenant_id           = var.azure_tenant_id
  tags                = local.resolved_tags

}
