# Azure MySQL DB Module

## Use Case
```hcl
module "mysql" {
  source = "github.com/Saurabhdw/Terraform-modules/mysql/modules"
  
  db_name = "mydatabase"
  location = "westeurope"
  admin_username = "azureuser"
  password = "P@ssw0rd12345!"
}
```