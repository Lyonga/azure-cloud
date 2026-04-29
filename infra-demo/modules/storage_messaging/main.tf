terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_kind             = "StorageV2"
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_replication_type
  min_tls_version          = "TLS1_2"
  tags                     = var.tags
}

resource "azurerm_storage_container" "containers" {
  for_each = toset(var.container_names)

  name                  = each.value
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = var.container_access_type
}

resource "azurerm_storage_queue" "queues" {
  for_each = toset(var.queue_names)

  name                 = each.value
  storage_account_name = azurerm_storage_account.storage.name
}
