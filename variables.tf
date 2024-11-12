variable "resource_group_name" {
  description = "The name of the resource group in which to create the virtual network peering."
  type = string
}

variable "virtual_network_name" {
  description = "The name of the virtual network."
  type = string
}

variable "remote_virtual_network_id" {
  description = "The full Azure resource ID of the remote virtual network."
  type = string
}

variable "allow_virtual_network_access" {
  description = "Controls if the traffic from the local virtual network can reach the remote virtual network."
  type = bool
  default = true
}

variable "allow_forwarded_traffic" {
  description = "Controls if forwarded traffic from VMs in the remote virtual network is allowed."
  type = bool
  default = false
}

variable "allow_gateway_transit" {
  description = "Controls gatewayLinks can be used in the remote virtual network’s link to the local virtual network."
  type = bool
  default = false
}

variable "local_subnet_names" {
  description = "A list of local Subnet names that are Subnet peered with remote Virtual Network."
  type = list(string)
  default = []
}

variable "only_ipv6_peering_enabled" {
  description = "Specifies whether only IPv6 address space is peered for Subnet peering."
  type = bool
  default = false
}

variable "peer_complete_virtual_networks_enabled" {
  description = "Specifies whether complete Virtual Network address space is peered."
  type = bool
  default = true
}

variable "remote_subnet_names" {
  description = "A list of remote Subnet names from remote Virtual Network that are Subnet peered."
  type = list(string)
  default = []
}

variable "use_remote_gateways" {
  description = "Controls if remote gateways can be used on the local virtual network."
  type = bool
  default = false
}

variable "triggers" {
  description = "A mapping of key values pairs that can be used to sync network routes from the remote virtual network to the local virtual network."
  type = map
  default = {}
}

variable "naming_convention_info" {
  description = "A mapping of naming convention information."
  type = map
  default = {
    name = {
      site = "site"
      env = "env"
      app = "app"
      name = "name"
      dest = "dest"
    }
  }
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type = map
}