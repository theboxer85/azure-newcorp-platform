# modules/vpn-connection/main.tf

resource "azurerm_vpn_site" "site" {
  name                = var.vpn_site_name
  resource_group_name = var.resource_group_name
  location            = var.location
  virtual_wan_id      = var.virtual_wan_id

  link {
    name       = "link-primary"
    ip_address = var.site_public_ip
    bgp {
      asn             = var.site_asn
      peering_address = var.site_bgp_peering_ip
    }
  }

  address_cidrs = var.address_cidrs
}

resource "azurerm_vpn_gateway_connection" "connection" {
  name               = var.vpn_connection_name
  vpn_gateway_id     = var.vpn_gateway_id
  remote_vpn_site_id = azurerm_vpn_site.site.id
  routing {
    associated_route_table = "defaultRouteTable"
  }

  vpn_link {
    name             = "link-primary"
    vpn_site_link_id = azurerm_vpn_site.site.link[0].id
    shared_key       = var.shared_key
    bgp_enabled      = var.bgp_enabled
    egress_nat_rule_ids  = []
    ingress_nat_rule_ids = []
    route_weight     = var.routing_weight
  }
}