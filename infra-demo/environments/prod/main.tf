locals {
  environment        = "prod"
  subscription_id    = "ce792f64-9e63-483b-8136-a2538b764f3d"
  subscription_scope = "prod"
  workspace_name     = terraform.workspace == "default" ? "demo-infra-prod" : terraform.workspace
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

  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = local.resolved_tags
}

module "function_app" {
  source = "../../modules/function_app"

  function_app_name        = var.function_app_name
  app_service_plan_name    = var.app_service_plan_name
  storage_account_name     = var.storage_account_name
  resource_group_name      = module.resource_group.name
  location                 = var.location
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
  location                 = var.location
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

  custom_name                = var.shared_log_analytics_custom_name
  resource_group_name        = module.resource_group.name
  location                   = var.location
  instance_index             = var.shared_log_analytics_instance_index
  retention_in_days          = var.shared_log_analytics_retention_in_days
  daily_quota_gb             = var.shared_log_analytics_daily_quota_gb
  internet_ingestion_enabled = var.shared_log_analytics_internet_ingestion_enabled
  internet_query_enabled     = var.shared_log_analytics_internet_query_enabled
  subscription_id            = local.subscription_id
  tenant_id                  = var.azure_tenant_id
  tags                       = local.resolved_tags
}
