# terraform-azurerm-loadbalancer

A terraform module to provide load balancers in Azure with the following
characteristics:

- Ability to specify `public` or `private` loadbalancer using: `var.type`.  Default is public.
- Specify subnet to use for the loadbalancer: `frontend_subnet_id`
- For `private` loadbalancer, specify the private ip address using`frontend_private_ip_address`
- Specify the type of the private ip address with `frontend_private_ip_address_allocation`, Dynamic or Static , default is `Dynamic`

## Input Variables:
```
  location                     = "westus"
  resource_group_name          = "myrg-123"
  prefix                       = "test"
  remote_port                  = {}
  lb_port                      = {}
  lb_probe_unhealthy_threshold = 2
  lb_probe_interval            = 5
  frontend_name                = "myPublicIP"
  allocation_method            = "Static"
  tags = {
    source = "terraform"
  }
  type                                   = "public"
  frontend_subnet_id                     = ""
  frontend_private_ip_address            = ""
  frontend_private_ip_address_allocation = "Dynamic"
  lb_sku                                 = "Basic"
  lb_probe                               = {}
  pip_sku                                = "Basic"
  name                                   = ""
  pip_name                               = ""
```

## Usage in Terraform 0.13

Public loadbalancer example:

```hcl
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "example-lb"
  location = "West Europe"
}

module "mylb" {
  source              = "Azure/loadbalancer/azurerm"
  resource_group_name = azurerm_resource_group.example.name
  name                = "lb-terraform-test"
  pip_name            = "pip-terraform-test"

  remote_port = {
    ssh = ["Tcp", "22"]
  }

  lb_port = {
    http = ["80", "Tcp", "80"]
  }

  lb_probe = {
    http = ["Tcp", "80", ""]
  }

  depends_on = [azurerm_resource_group.example]
}

```

## Usage in Terraform 0.12

Public loadbalancer example:

```hcl
module "mylb" {
  source              = "github.com/Saurabhdw/Terraform-modules/lb-external-azure/modules"
  resource_group_name = <rg_name>
  prefix              = "terraform-test"

  remote_port = {
    ssh = ["Tcp", "22"]
  }

  lb_port = {
    http = ["80", "Tcp", "80"]
  }

  lb_probe = {
    http = ["Tcp", "80", ""]
  }

}

```

Private loadbalancer example:

```hcl

module "mylb" {
  source                                 = "github.com/Saurabhdw/Terraform-modules/lb-internal-azure/modules"
  resource_group_name                    = <rg_name>
  type                                   = "private"
  frontend_subnet_id                     = <Subnet_id>
  frontend_private_ip_address_allocation = "Static"
  frontend_private_ip_address            = "10.0.1.6"
  lb_sku                                 = "Standard"
  pip_sku                                = "Standard" #`pip_sku` must match `lb_sku` 

  remote_port = {
    ssh = ["Tcp", "22"]
  }

  lb_port = {
    http  = ["80", "Tcp", "80"]
    https = ["443", "Tcp", "443"]
  }

  lb_probe = {
    http  = ["Tcp", "80", ""]
    http2 = ["Http", "1443", "/"]
  }

  tags = {
    cost-center = "12345"
    source      = "terraform"
  }
}

module "network" {
  source              = "Azure/network/azurerm"
  resource_group_name = azurerm_resource_group.example.name
  address_space       = "10.0.0.0/16"
  subnet_prefixes     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  subnet_names        = ["subnet1", "subnet2", "subnet3"]

  tags = {
    environment = "dev"
    costcenter  = "it"
  }
}
```


