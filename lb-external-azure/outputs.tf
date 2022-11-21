output "azurerm_resource_group_tags" {
  description = "the tags provided for the resource group"
  value       = module.lb_external.azurerm_resource_group_tags
}

output "azurerm_resource_group_name" {
  description = "name of the resource group provisioned"
  value       = module.lb_external.azurerm_resource_group_name
}
output "azurerm_lb_id" {
  description = "the id for the azurerm_lb resource"
  value       = module.lb_external.azurerm_lb_id
}

output "azurerm_lb_frontend_ip_configuration" {
  description = "the frontend_ip_configuration for the azurerm_lb resource"
  value       = module.lb_external.azurerm_lb_frontend_ip_configuration
}

output "azurerm_lb_probe_ids" {
  description = "the ids for the azurerm_lb_probe resources"
  value       = module.lb_external.azurerm_lb_probe_ids
}

output "azurerm_lb_nat_rule_ids" {
  description = "the ids for the azurerm_lb_nat_rule resources"
  value       = module.lb_external.azurerm_lb_nat_rule_ids
}

output "azurerm_public_ip_id" {
  description = "the id for the azurerm_lb_public_ip resource"
  value       = module.lb_external.azurerm_public_ip_id
}

output "azurerm_public_ip_address" {
  description = "the ip address for the azurerm_lb_public_ip resource"
  value       = module.lb_external.azurerm_public_ip_address
}

output "azurerm_lb_backend_address_pool_id" {
  description = "the id for the azurerm_lb_backend_address_pool resource"
  value       = module.lb_external.azurerm_lb_backend_address_pool_id
}