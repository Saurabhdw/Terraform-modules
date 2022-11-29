# provider "azurerm" {
#   subscription_id = "REPLACE-WITH-YOUR-SUBSCRIPTION-ID"
#   client_id       = "REPLACE-WITH-YOUR-CLIENT-ID"
#   client_secret   = "REPLACE-WITH-YOUR-CLIENT-SECRET"
#   tenant_id       = "REPLACE-WITH-YOUR-TENANT-ID"
# }

resource "azurerm_resource_group" "rg" {
  name     = "${var.resource_group_name}"
  location = "${var.location}"
}

resource "azurerm_mssql_database" "db" {
  name                             = "${var.db_name}"
  server_id                        = "${azurerm_mssql_server.server.id}"
  sku_name                         = "${var.sku_name}"
  collation                        = "${var.collation}"
  create_mode                      = "Default"
  tags                             = "${var.tags}"
}

resource "azurerm_mssql_server" "server" {
  name                         = "${var.db_name}-sqlsvr"
  resource_group_name          = "${azurerm_resource_group.rg.name}"
  location                     = "${var.location}"
  version                      = "${var.server_version}"
  administrator_login          = "${var.sql_admin_username}"
  administrator_login_password = "${var.sql_password}"
  tags                         = "${var.tags}"
}

resource "azurerm_mssql_firewall_rule" "fw" {
  name                = "${var.db_name}-fwrules"
  server_id           = "${azurerm_mssql_server.server.id}"
  start_ip_address    = "${var.start_ip_address}"
  end_ip_address      = "${var.end_ip_address}"
}