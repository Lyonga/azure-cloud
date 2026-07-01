resource_group_name      = "rg-demo-np1"
function_app_name        = "func-demo-np1-001"
app_service_plan_name    = "asp-demo-np1-001"
storage_account_name     = "stdemonp1001"
location                 = "eastus"
storage_account_tier     = "Standard"
storage_replication_type = "LRS"
os_type                  = "Linux"
sku_name                 = "B1"
runtime_stack            = "python"
runtime_version          = "3.11"
functions_worker_runtime = "python"
python_version           = "3.11"

app_settings = {}

common_tags = {
  CostCenter = "engineering"
}

enable_shared_storage_messaging = true
shared_storage_account_name     = "stlyonganp1shared01"
shared_storage_account_tier     = "Standard"
shared_storage_replication_type = "LRS"
shared_container_access_type    = "private"
shared_container_names          = ["app-data", "app-archive"]
shared_queue_names              = ["requests", "notifications"]

shared_log_analytics_custom_name                = "lyonga-azure-np1-shared-eus-01"
shared_log_analytics_instance_index             = 1
shared_log_analytics_retention_in_days          = 60
shared_log_analytics_daily_quota_gb             = 1
shared_log_analytics_internet_ingestion_enabled = true
shared_log_analytics_internet_query_enabled     = true
