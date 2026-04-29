output "resource_group_id" {
  description = "ID of the resource group"
  value       = module.resource_group.id
}

output "resource_group_name" {
  description = "Name of the resource group"
  value       = module.resource_group.name
}

output "function_app_id" {
  description = "ID of the function app"
  value       = module.function_app.function_app_id
}

output "function_app_name" {
  description = "Name of the function app"
  value       = module.function_app.function_app_name
}

output "function_app_default_hostname" {
  description = "Default hostname of the function app"
  value       = module.function_app.default_hostname
}

output "storage_account_name" {
  description = "Name of the storage account"
  value       = module.function_app.storage_account_name
}

output "shared_storage_account_name" {
  description = "Name of the shared storage account"
  value       = try(module.storage_messaging[0].storage_account_name, null)
}

output "shared_storage_container_ids" {
  description = "IDs of the shared storage containers"
  value       = try(module.storage_messaging[0].container_ids, {})
}

output "shared_storage_queue_ids" {
  description = "IDs of the shared storage queues"
  value       = try(module.storage_messaging[0].queue_ids, {})
}

output "shared_log_analytics_workspace_id" {
  description = "ID of the shared Log Analytics workspace"
  value       = try(module.log_analytics_public[0].workspace_id, null)
}

output "shared_log_analytics_workspace_customer_id" {
  description = "Customer ID of the shared Log Analytics workspace"
  value       = try(module.log_analytics_public[0].workspace_customer_id, null)
}
