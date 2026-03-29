# modules/vpn-connection/variables.tf

variable "vpn_site_name" { type = string }
variable "vpn_connection_name" { type = string }
variable "resource_group_name" { type = string }
variable "location" { type = string }
variable "vpn_gateway_id" { type = string }
variable "routing_weight" {
  type    = number
  default = 0
}
variable "bgp_enabled" {
  type    = bool
  default = true
}
variable "site_public_ip" { type = string }      # Dallas DC WAN IP
variable "site_asn" { type = number }            # 65001
variable "site_bgp_peering_ip" { type = string } # Dallas CE BGP peer IP
variable "shared_key" {
  type      = string
  sensitive = true
}
variable "address_cidrs" { type = list(string) } # Dallas on-prem prefixes
variable "virtual_wan_id" { type = string }