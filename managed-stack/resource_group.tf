resource "azurerm_resource_group" "this" {
    name = "managed-stack-euw-prod"
    location = "West Europe"
    tags = {
        "environment" = "production"
    }
}
