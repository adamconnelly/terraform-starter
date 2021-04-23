# This resource here is to show you how plan policies work.

resource "random_password" "secret" {
  length  = 40
  special = true
}

module "resource_group" {
  source = "../resource-group"
  environment = var.environment
  application = "managed-stack"
  region = "euw"
}

module "resource_group_eun" {
  source = "../resource-group"
  environment = var.environment
  application = "managed-stack"
  region = "eun"
}

resource "azurerm_resource_group" "group-without-environment-tag" {
    name = "my-resource-group"
    location = "West Europe"
    tags = {
        "application" = "My app"
        "region" = "euw"
    }
}
