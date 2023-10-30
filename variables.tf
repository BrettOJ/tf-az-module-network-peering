
  variable "resource_group_name" {
    description = "name of the resource group"
  }

  variable "naming_convention_info" {
    
  }

  variable "virtual_network_name" {
    description = "name of the virtual network to apply the peering to"
  }

  variable "remote_virtual_network_id" {
    description = "id of the remote network to peer the network to"
  }

  variable "allow_virtual_network_access" {
    description = " Controls if the VMs in the remote virtual network can access VMs in the local virtual network. Defaults to true."
  }

  variable "allow_forwarded_traffic" {
    description = "Controls if forwarded traffic from VMs in the remote virtual network is allowed. Defaults to false."
  }

variable "allow_gateway_transit" {
  description = "allow_gateway_transit - must be set to false for vnet Global Peering"
  default = false
}

variable "use_remote_gateways" {
  description = "Controls if remote gateways can be used on the local virtual network. If the flag is set to true, and allow_gateway_transit on the remote peering is also true, virtual network will use gateways of remote virtual network for transit. Only one peering can have this flag set to true. This flag cannot be set if virtual network already has a gateway. Defaults to false."
}

variable "tags" {
  
}
