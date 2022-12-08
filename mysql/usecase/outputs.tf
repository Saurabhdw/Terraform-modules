output "fqdn" {
  description = "The fqdn of MySQL Server."
  value       = module.mysql.fqdn
}

output "id" {
  description = "The id of MySQL Server."
  value       = module.mysql.id
}

output "server_name" {
  description = "The server name of MySQL Server."
  value       = module.mysql.server_name
}

output "admin_username" {
  description = "The administrator username of MySQL Server."
  value       = module.mysql.admin_username
}
