terraform {
  # Set TF_WORKSPACE in CI or your shell.
  # Recommended workspace for this directory: demo-infra-np1
  cloud {
    organization = "lyonga-org"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  required_version = ">= 1.0"
}

provider "azurerm" {
  features {}

  subscription_id = local.subscription_id
}
