output "fqdn" {
  description = "The fqdn of MySQL Server."
  value       = azurerm_mysql_server.server.fqdn
}

output "id" {
  description = "The id of MySQL Server."
  value       = azurerm_mysql_server.server.id
}

output "server_name" {
  description = "The server name of MySQL Server."
  value       = azurerm_mysql_server.server.name
}

output "admin_username" {
  description = "The administrator username of MySQL Server."
  value       = var.admin_username
}
