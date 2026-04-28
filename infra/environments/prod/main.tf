locals {
  environment        = "prod"
  subscription_id    = "ce792f64-9e63-483b-8136-a2538b764f3d"
  subscription_scope = "prod"
  default_location   = "eastus"
  workspace_name     = terraform.workspace == "default" ? "demo-infra-prod" : terraform.workspace
  resolved_location  = coalesce(var.location, local.default_location)
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
  location            = local.resolved_location
  tags                = local.resolved_tags
}

module "function_app" {
  source = "../../modules/function_app"

  function_app_name        = var.function_app_name
  app_service_plan_name    = var.app_service_plan_name
  storage_account_name     = var.storage_account_name
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
