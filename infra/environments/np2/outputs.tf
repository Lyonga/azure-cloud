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
