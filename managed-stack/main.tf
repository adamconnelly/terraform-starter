# This resource here is to show you how plan policies work.

resource "random_password" "secret" {
  length  = 30
  special = true
}

resource "random_password" "short-password" {
  length = 12
  special = true
}
