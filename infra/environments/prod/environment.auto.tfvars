resource_group_name      = "rg-demo-prod"
function_app_name        = "func-demo-prod-001"
app_service_plan_name    = "asp-demo-prod-001"
storage_account_name     = "stdemoprod001"
location                 = "eastus"
storage_account_tier     = "Standard"
storage_replication_type = "GRS"
os_type                  = "Linux"
sku_name                 = "P1V2"
runtime_stack            = "python"
runtime_version          = "3.11"
functions_worker_runtime = "python"
python_version           = "3.11"

app_settings = {}

common_tags = {
  CostCenter = "engineering"
}
