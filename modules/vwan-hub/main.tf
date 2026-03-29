resource "azurerm_virtual_wan" "vwan" {
  name                = var.vwan_name
  resource_group_name = var.resource_group_name
  location            = var.location
  type                = "Standard"
}

resource "azurerm_virtual_hub" "vwan_hub" {
  name                = var.hub_name
  resource_group_name = var.resource_group_name
  location            = var.location
  virtual_wan_id      = azurerm_virtual_wan.vwan.id
  address_prefix      = var.hub_address_prefix
}

resource "azurerm_express_route_gateway" "er_gateway" {
  name                = var.er_gateway_name
  resource_group_name = var.resource_group_name
  location            = var.location
  virtual_hub_id      = azurerm_virtual_hub.vwan_hub.id
  scale_units         = var.scale_units
}

resource "azurerm_vpn_gateway" "vpn_gateway" {
  name                = var.vpn_gateway_name
  resource_group_name = var.resource_group_name
  location            = var.location
  virtual_hub_id      = azurerm_virtual_hub.vwan_hub.id
  scale_unit          = var.vpn_scale_unit
}
