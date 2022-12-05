# AZURE-SQL-Database-module

This is a terraform module for Azure MSSQL database provisioning.

## USE CASE:
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