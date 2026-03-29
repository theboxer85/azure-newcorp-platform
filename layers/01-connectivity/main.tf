module "eastus_hub" {
  source              = "../../modules/vwan-hub"
  hub_name            = "eastus_hub"
  vwan_name           = "vwan_prod"
  location            = "eastus"
  resource_group_name = "rg_connectivity_eastus"
  hub_address_prefix  = "10.1.0.0/23"
  er_gateway_name     = "eastus_er_gateway"
  vpn_gateway_name    = "eastus_vpn_gateway"
}

module "west_europe_hub" {
  source              = "../../modules/vwan-hub"
  hub_name            = "westeurope_hub"
  vwan_name           = "vwan_prod"
  location            = "westeurope"
  resource_group_name = "rg_connectivity_westeurope"
  hub_address_prefix  = "10.3.0.0/23"
  er_gateway_name     = "westeurope_er_gateway"
  vpn_gateway_name    = "westeurope_vpn_gateway"
}

module "er_circuit_dallas" {
  source = "../../modules/expressroute-circuit"
  # dallas-specific vars
  routing_weight = 100
}

module "er_circuit_london" {
  source = "../../modules/expressroute-circuit"
  # london-specific vars
  routing_weight = 100
}

module "vpn_connection_dallas" {
  source = "../../modules/vpn-connection"
  # dallas-specific vars
  routing_weight = 0
}

module "vpn_connection_london" {
  source = "../../modules/vpn-connection"
  # london-specific vars
  routing_weight = 0
}