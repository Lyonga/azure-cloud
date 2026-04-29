output "workspace_id" {
  description = "The ID of the Log Analytics workspace."
  value       = module.log_analytics.workspace_id
}

output "workspace_customer_id" {
  description = "The customer ID of the Log Analytics workspace."
  value       = module.log_analytics.workspace_customer_id
}

output "tags" {
  description = "Tags returned by the public module."
  value       = module.log_analytics.tags
}
