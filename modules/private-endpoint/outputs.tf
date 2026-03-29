output "private_endpoint_id" {
  value = azurerm_private_endpoint.endpoint.id
}

output "private_endpoint_ip" {
  value = azurerm_private_endpoint.endpoint.private_service_connection[0].private_ip_address
}