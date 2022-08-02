resource "azurerm_static_site" "main" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
}

output "name" {
  value = azurerm_static_site.main.name
}

output "api_key" {
  value = azurerm_static_site.main.api_key
}
  
