output "vwan_hub_id" {
  value = azurerm_vwan_hub.vwan_hub.id
}

output "vwan_hub_name" {
  value = azurerm_vwan_hub.vwan_hub.name
}

output "er_gateway_id" {
  value = azurerm_express_route_gateway.vwan_hub.er_gateway_id
}

output "vpn_gateway_id" {
  value = azurerm_vpn_gateway_id.vwan_hub.vpn_gateway_id
}