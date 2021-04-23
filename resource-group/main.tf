locals {
    region_abbrev_map = {
        "euw" = "West Europe"
    }
}

resource "azurerm_resource_group" "this" {
    name = "${var.application}-${var.region}-${var.environment}"
    location = local.region_abbrev_map[var.region]
    tags = {
        "environment" = var.environment
        "application" = var.application
        "region" = var.region
    }
}
