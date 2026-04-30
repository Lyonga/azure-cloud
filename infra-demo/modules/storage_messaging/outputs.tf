output "storage_account_id" {
  description = "The ID of the Storage Account"
  value       = azurerm_storage_account.storage.id
}

output "storage_account_name" {
  description = "The name of the Storage Account"
  value       = azurerm_storage_account.storage.name
}

output "primary_blob_endpoint" {
  description = "Primary blob endpoint for the Storage Account"
  value       = azurerm_storage_account.storage.primary_blob_endpoint
}

output "container_ids" {
  description = "IDs of the created storage containers"
  value       = { for name, container in azurerm_storage_container.containers : name => container.id }
}

output "queue_ids" {
  description = "IDs of the created storage queues"
  value       = { for name, queue in azurerm_storage_queue.queues : name => queue.id }
}
