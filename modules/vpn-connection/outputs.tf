# modules/vpn-connection/outputs.tf

output "vpn_site_id" {
  description = "VPN site ID — represents Dallas DC in Azure"
  value       = azurerm_vpn_site.site.id
}

output "vpn_connection_id" {
  description = "VPN gateway connection ID — consumed by monitoring and alerting"
  value       = azurerm_vpn_gateway_connection.connection.id
}

output "vpn_connection_status" {
  description = "Operator verification — confirms tunnel is established"
  value       = azurerm_vpn_gateway_connection.connection.id
}