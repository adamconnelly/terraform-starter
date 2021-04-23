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
