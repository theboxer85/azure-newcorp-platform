resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "workload" {
  name                 = var.workload_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.workload_subnet_address_prefix]
}

resource "azurerm_subnet" "private_endpoint" {
  name                              = var.private_endpoint_subnet_name
  resource_group_name               = var.resource_group_name
  virtual_network_name              = azurerm_virtual_network.vnet.name
  address_prefixes                  = [var.private_endpoint_subnet_address_prefix]
  private_endpoint_network_policies = "Enabled"
}

resource "azurerm_virtual_hub_connection" "hub_connection" {
  name                      = var.hub_connection_name
  virtual_hub_id            = var.hub_id
  remote_virtual_network_id = azurerm_virtual_network.vnet.id
}
