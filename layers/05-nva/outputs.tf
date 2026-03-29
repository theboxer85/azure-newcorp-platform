output "nva_id_eastus" {
  description = "Palo Alto NVA ID — East US hub, consumed by routing intent"
  value       = azurerm_palo_alto_virtual_network_appliance.nva_eastus.id
}

output "nva_id_westeurope" {
  description = "Palo Alto NVA ID — West Europe hub, consumed by routing intent"
  value       = azurerm_palo_alto_virtual_network_appliance.nva_westeurope.id
}

output "firewall_id_eastus" {
  description = "NGFW resource ID — East US, consumed by 04-security for log configuration"
  value       = azurerm_palo_alto_next_generation_firewall_virtual_hub_panorama.ngfw_eastus.id
}

output "firewall_id_westeurope" {
  description = "NGFW resource ID — West Europe, consumed by 04-security for log configuration"
  value       = azurerm_palo_alto_next_generation_firewall_virtual_hub_panorama.ngfw_westeurope.id
}

output "routing_intent_id_eastus" {
  description = "Routing intent ID — East US, consumed by monitoring and verification"
  value       = azurerm_virtual_hub_routing_intent.routing_intent_eastus.id
}

output "routing_intent_id_westeurope" {
  description = "Routing intent ID — West Europe, consumed by monitoring and verification"
  value       = azurerm_virtual_hub_routing_intent.routing_intent_westeurope.id
}