output "workspace_name" {
  description = "The name of the Log Analytics workspace."
  value       = module.log_analytics.name
}

output "workspace_id" {
  description = "The ID of the Log Analytics workspace."
  value       = module.log_analytics.id
}

output "workspace_customer_id" {
  description = "The customer ID of the Log Analytics workspace."
  value       = module.log_analytics.workspace_id
}
