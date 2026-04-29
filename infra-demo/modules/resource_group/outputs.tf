output "id" {
  description = "The ID of the created Resource Group"
  value       = azurerm_resource_group.rg.id
}

output "name" {
  description = "The name of the created Resource Group"
  value       = azurerm_resource_group.rg.name
}
