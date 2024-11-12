locals {
  naming_convention_info = {
    name         = "001"
    site          = "dev"
    env  = "boj"
    app = "web"
    dest     = "1"
  }
  tags = {
    "Environment" = "Dev"
    "Owner"       = "DevOps"
    "Project"     = "MyProject"
  }
}


module "resource_groups" {
  source = "git::https://github.com/BrettOJ/tf-az-module-resource-group?ref=main"
  resource_groups = {
    vnp = {
      name                   = var.resource_group_name
      location               = var.location
      naming_convention_info = local.naming_convention_info
      tags                   = local.tags
    }
  }
}

module "azure_virtual_network_peering" {
  source = "git::https://github.com/BrettOJ/tf-az-module-network-peering?ref=main"
  resource_group_name          = module.resource_groups.resource_group_output[0].name
  virtual_network_name         = var.virtual_network_name
  remote_virtual_network_id    = var.remote_virtual_network_id
  allow_virtual_network_access = var.allow_virtual_network_access
  allow_forwarded_traffic      = var.allow_forwarded_traffic
  allow_gateway_transit        = var.allow_gateway_transit 
  use_remote_gateways          = var.use_remote_gateways
  local_subnet_names           = [var.local_subnet_names]
  remote_subnet_names          = [var.remote_subnet_names]
  only_ipv6_peering_enabled    = var.only_ipv6_peering_enabled
  triggers = var.triggers
}