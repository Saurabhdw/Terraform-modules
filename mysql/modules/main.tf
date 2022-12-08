resource "azurerm_resource_group" "mysql" {
  count    = var.resource_group_create ? 1 : 0
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

resource "azurerm_mysql_server" "server" {
  name                             = var.name
  administrator_login              = var.admin_username
  administrator_login_password     = var.admin_password
  auto_grow_enabled                = var.auto_grow_enabled
  backup_retention_days            = var.backup_retention_days
  geo_redundant_backup_enabled     = var.geo_redundant_backup_enabled
  location                         = var.location
  public_network_access_enabled    = var.public_network_access_enabled
  resource_group_name              = var.resource_group_name
	sku_name                         = var.sku_name
  ssl_enforcement_enabled          = var.ssl_enforcement_enabled
  ssl_minimal_tls_version_enforced = var.ssl_minimal_tls_version_enforced
  storage_mb                       = var.storage_mb
  tags                             = var.tags
  version                          = var.db_version
}

resource "azurerm_mysql_database" "database" {
  for_each            = var.dbs

  name                = each.value.name
  charset             = lookup(each.value, "charset", "utf8")
  collation           = lookup(each.value, "collation", "utf8_unicode_ci")
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_server.server.name
}

resource "azurerm_mysql_firewall_rule" "firewall_rule" {
  for_each            = var.firewall_rules

  name                = each.key
  start_ip_address    = each.value.start_ip
  end_ip_address      = each.value.end_ip
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_server.server.name
}

resource "azurerm_mysql_virtual_network_rule" "vnet_rule" {
  for_each            = var.vnet_rules

  name                = each.key
  subnet_id           = each.value
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_server.server.name
}

resource "azurerm_mysql_configuration" "config" {
  for_each            = var.mysql_configurations

  name                = each.key
  value               = each.value
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_server.server.name
}

resource "azurerm_private_endpoint" "this" {
  count                = var.private_endpoint_enabled ? 1 : 0

  name                 = "${var.name}-pe"
  location             = var.location
  resource_group_name  = var.resource_group_name
  subnet_id            = var.private_endpoint_subnet_id

  private_dns_zone_group {
    name                 = "privatelink_mysql"
    private_dns_zone_ids = var.private_endpoint_dns_zone_ids
  }

  private_service_connection {
    name                           = "${var.name}-psc"
    is_manual_connection           = false
    private_connection_resource_id = azurerm_mysql_server.server.id
    subresource_names              = ["mysqlServer"]
  }
}