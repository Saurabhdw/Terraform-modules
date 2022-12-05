# AZURE-SQL-Database-module

This is a terraform module for Azure MSSQL database provisioning.

## USE CASE:

### main.tf
```hcl
module "sql-database" {
  # source              = "Azure/database/azurerm"
  source              = "github.com/Saurabhdw/Terraform-modules/SQL-database/modules"
  
  resource_group_name = var.azure_resource_group_name
  location            = var.azure_location
  db_name             = var.azure_db_name
  sql_admin_username  = var.azure_sql_admin_username
  sql_password        = var.azure_sql_password

  tags                = var.azure_tags
  
}
```

### variables.tf
```hcl
variable "azure_resource_group_name" {
  description = "Default resource group name that the database will be created in."
  default     = "myapp-rg"
}

variable "azure_location" {
  description = "The location/region where the database and server are created. Changing this forces a new resource to be created."
}

variable "azure_server_version" {
  description = "The version for the database server. Valid values are: 2.0 (for v11 server) and 12.0 (for v12 server)."
  default     = "12.0"
}

variable "azure_db_name" {
  description = "The name of the database to be created."
}

variable "azure_sku_name" {
  description = "The name of the SKU used by the database."
  default     = "Basic"
}

variable "azure_collation" {
  description = "The collation for the database. Default is SQL_Latin1_General_CP1_CI_AS"
  default     = "SQL_Latin1_General_CP1_CI_AS"
}

variable "azure_sql_admin_username" {
  description = "The administrator username of the SQL Server."
}

variable "azure_sql_password" {
  description = "The administrator password of the SQL Server."
}

variable "azure_start_ip_address" {
  description = "Defines the start IP address used in your database firewall rule."
  default     = "0.0.0.0"
}

variable "azure_end_ip_address" {
  description = "Defines the end IP address used in your database firewall rule."
  default     = "0.0.0.0"
}

variable "azure_tags" {
  description = "The tags to associate with your network and subnets."
  type        = map(string)

  default = {
    tag1 = ""
    tag2 = ""
  }
}
```

### outputs.tf
```hcl
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
  ```
### terraform.tfvars
```hcl
azure_resource_group_name = "myapp"
azure_location            = "westus"
azure_db_name             = "mydatabase"
azure_sql_admin_username  = "mradministrator"
azure_sql_password        = "P@ssw0rd12345!"

azure_tags                = {
                        environment = "dev"
                        costcenter  = "it"
                      }
```