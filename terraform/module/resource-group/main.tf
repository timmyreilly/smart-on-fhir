variable "environment" {}
variable "location" {
    default = "eastus"
}
variable "tags" {
    default = {
        environment = "dev"
    }
}

resource "azurerm_resource_group" "main" {
  name                = var.environment
  location            = var.location
  tags                = var.tags
}