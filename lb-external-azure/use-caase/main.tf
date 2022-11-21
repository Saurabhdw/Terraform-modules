module "lb_external" {
  source = "github.com/Saurabhdw/Terraform-modules/lb-external-azure/modules"
  # source  = "Azure/loadbalancer/azurerm"
  # version = "3.4.0"


  # location                     = "westus"
  resource_group_name          = "myrg-123"
  # prefix                       = "test"
  # remote_port                  = {}
  # lb_port                      = {}
  # lb_probe_unhealthy_threshold = 2
  # lb_probe_interval            = 5
  # frontend_name                = "myPublicIP"
  # allocation_method            = "Static"
  # tags = {
  #   source = "terraform"
  # }
  # type                                   = "public"
  # frontend_subnet_id                     = ""
  # frontend_private_ip_address            = ""
  # frontend_private_ip_address_allocation = "Dynamic"
  # lb_sku                                 = "Basic"
  # lb_probe                               = {}
  # pip_sku                                = "Basic"
  # name                                   = ""
  # pip_name                               = ""

}