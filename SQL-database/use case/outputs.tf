output "azure_database_name" {
  description = "Database name of the Azure SQL Database created."
  value       = module.sql-database.database_name
}

output "azure_sql_server_name" {
  description = "Server name of the Azure SQL Database created."
  value       = module.sql-database.sql_server_name
}

output "azure_sql_server_location" {
  description = "Location of the Azure SQL Database created."
  value       = module.sql-database.sql_server_location
}

output "azure_sql_server_version" {
  description = "Version the Azure SQL Database created."
  value       = module.sql-database.sql_server_version
}

output "azure_sql_server_fqdn" {
  description = "Fully Qualified Domain Name (FQDN) of the Azure SQL Database created."
  value       = module.sql-database.sql_server_fqdn
}

output "azure_connection_string" {
  description = "Connection string for the Azure SQL Database created."
  value       = module.sql-database.connection_string
  }