terraform {

  required_version = ">= 1.1.8"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.2.0"
    }

  }
  backend "azurerm" {
    resource_group_name  = "staging-samples"
    storage_account_name = "corewusstorage"
    container_name       = "state"
    key                  = "1.static.tireilly.microsoft.tfstate"
    subscription_id = "5c514147-21c3-4f7e-8329-625443da4254"
  }
}


provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = lookup(local.tags, "environment", "prod") == "dev" ? false : true
    }
  }
}