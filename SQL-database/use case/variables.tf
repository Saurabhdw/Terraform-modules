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