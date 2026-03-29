output "circuit_id" {
  # consumed by: association resource linking circuit to ER gateway
  value = azurerm_express_route_circuit.circuit.id
}

output "service_key" {
  # consumed by: carrier provisioning — operator hands this to the carrier
  sensitive = true
  value = azurerm_express_route_circuit.circuit.service_key
}

output "provisioning_state" {
  # consumed by: operator verification — both sides must show Provisioned
  value = azurerm_express_route_circuit.circuit.provisioning_state
}

output "peering_id" {
  # consumed by: association resource, BGP tuning configuration
  value = azurerm_express_route_circuit.circuit.peering_id
}