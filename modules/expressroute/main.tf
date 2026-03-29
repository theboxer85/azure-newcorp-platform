# main.tf
resource "azurerm_express_route_circuit" "circuit" {
  name                  = var.circuit_name
  resource_group_name   = var.resource_group_name
  location              = var.location
  peering_location      = var.peering_location
  bandwidth_in_mbps     = var.bandwidth_in_mbps
  service_provider_name = var.service_provider_name

  sku {
    tier   = var.sku_tier
    family = var.sku_family
  }
}

resource "azurerm_express_route_circuit_peering" "private" {
  peering_type                  = "AzurePrivatePeering"
  express_route_circuit_name    = azurerm_express_route_circuit.circuit.name
  resource_group_name           = var.resource_group_name
  peer_asn                      = 65001
  primary_peer_address_prefix   = var.primary_peer_subnet
  secondary_peer_address_prefix = var.secondary_peer_subnet
  vlan_id                       = var.vlan_id
}

resource "azurerm_express_route_gateway_connection" "connection" {
  name                         = "${var.circuit_name}-connection"
  express_route_gateway_id     = var.er_gateway_id
  express_route_circuit_peering_id = azurerm_express_route_circuit_peering.private.id
}