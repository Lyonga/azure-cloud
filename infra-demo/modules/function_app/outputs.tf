output "function_app_id" {
  description = "The ID of the Function App"
  value       = azurerm_linux_function_app.function_app.id
}

output "function_app_name" {
  description = "The name of the Function App"
  value       = azurerm_linux_function_app.function_app.name
}

output "default_hostname" {
  description = "The default hostname of the Function App"
  value       = azurerm_linux_function_app.function_app.default_hostname
}

output "storage_account_id" {
  description = "The ID of the Storage Account"
  value       = azurerm_storage_account.storage.id
}

output "storage_account_name" {
  description = "The name of the Storage Account"
  value       = azurerm_storage_account.storage.name
}
