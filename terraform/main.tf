
locals {
    environment = "stagetireillystatic"
    location = "eastus2"
    tags = {
        environment = "stage"
    }
}

module "resource_group" {
    source = "./module/resource-group"
    environment = local.environment
    location = local.location
    tags = local.tags 
}

module "static_site" {
    source = "./module/static-site"
    name = "demosite"
    resource_group_name = local.environment
    location = local.location
}

output "deploy_key" {
    value = module.static_site.api_key
}