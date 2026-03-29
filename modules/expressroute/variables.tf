# variables.tf
variable "circuit_name" { type = string }
variable "resource_group_name" { type = string }
variable "location" { type = string }
variable "peering_location" { type = string } # e.g. "Dallas" — carrier facility
variable "bandwidth_in_mbps" { type = number }
variable "service_provider_name" { type = string } # e.g. "Equinix"
variable "sku_tier" { type = string }              # "Standard" or "Premium"
variable "sku_family" { type = string }            # "MeteredData" or "UnlimitedData"
variable "primary_peer_subnet" { type = string }   # /30 for primary BGP session
variable "secondary_peer_subnet" { type = string } # /30 for secondary BGP session
variable "vlan_id" { type = number }               # carrier-assigned VLAN
variable "er_gateway_id" { type = string }         # passed from connectivity remote state
