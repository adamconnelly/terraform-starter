resource "random_string" "storage-account-name" {
  length           = 22
  number           = true
  upper            = false
  special          = false
}

resource "azurerm_storage_account" "this" {
  name                     = random_string.storage-account-name.result
  resource_group_name      = azurerm_resource_group.this.name
  location                 = azurerm_resource_group.this.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
