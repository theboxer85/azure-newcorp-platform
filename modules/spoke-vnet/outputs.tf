output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

output "vnet_address_space" {
  value = azurerm_virtual_network.vnet.address_space
}

output "workload_subnet_id" {
  value = azurerm_subnet.workload.id
}

output "private_endpoint_subnet_id" {
  value = azurerm_subnet.private_endpoint.id
}

output "hub_connection_id" {
  value = azurerm_virtual_hub_connection.hub_connection.id
}