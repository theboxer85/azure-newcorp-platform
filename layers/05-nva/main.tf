data "terraform_remote_state" "connectivity" {
  backend = "azurerm"
  config = {
    resource_group_name  = "rg-tfstate-prod"
    storage_account_name = "newcorptfstateprod"
    container_name       = "tfstate"
    key                  = "01-connectivity.tfstate"
  }
}

resource "azurerm_public_ip" "ngfw_ip_eastus" {
  name                    = "pip-ngfw-eastus"
  location                = var.location_eastus
  resource_group_name     = var.resource_group_name
  allocation_method       = "Dynamic"
  idle_timeout_in_minutes = 30
}

resource "azurerm_public_ip" "ngfw_ip_westeurope" {
  name                    = "pip-ngfw-westeurope"
  location                = var.location_westeurope
  resource_group_name     = var.resource_group_name
  allocation_method       = "Dynamic"
  idle_timeout_in_minutes = 30
}

resource "azurerm_palo_alto_virtual_network_appliance" "nva_eastus" {
  name           = var.nva_name_eastus
  virtual_hub_id = data.terraform_remote_state.connectivity.outputs.eastus_hub_id
}

resource "azurerm_palo_alto_virtual_network_appliance" "nva_westeurope" {
  name           = var.nva_name_westeurope
  virtual_hub_id = data.terraform_remote_state.connectivity.outputs.westeurope_hub_id
}

resource "azurerm_palo_alto_next_generation_firewall_virtual_hub_panorama" "ngfw_eastus" {
  name                   = var.ngfw_name_eastus
  location               = var.location_eastus
  resource_group_name    = var.resource_group_name
  panorama_base64_config = var.panorama_base64_config
  network_profile {
    virtual_hub_id               = data.terraform_remote_state.connectivity.outputs.eastus_hub_id
    network_virtual_appliance_id = azurerm_palo_alto_virtual_network_appliance.nva_eastus.id
    public_ip_address_ids        = [azurerm_public_ip.ngfw_ip_eastus.id]
  }
}

resource "azurerm_palo_alto_next_generation_firewall_virtual_hub_panorama" "ngfw_westeurope" {
  name                   = var.ngfw_name_westeurope
  location               = var.location_westeurope
  resource_group_name    = var.resource_group_name
  panorama_base64_config = var.panorama_base64_config
  network_profile {
    virtual_hub_id               = data.terraform_remote_state.connectivity.outputs.westeurope_hub_id
    network_virtual_appliance_id = azurerm_palo_alto_virtual_network_appliance.nva_westeurope.id
    public_ip_address_ids        = [azurerm_public_ip.ngfw_ip_westeurope.id]
  }
}

resource "azurerm_virtual_hub_routing_intent" "routing_intent_eastus" {
  name           = var.routing_intent_name_eastus
  virtual_hub_id = data.terraform_remote_state.connectivity.outputs.eastus_hub_id

  routing_policy {
    name         = "InternetTrafficPolicy"
    destinations = ["Internet"]
    next_hop     = azurerm_palo_alto_virtual_network_appliance.nva_eastus.id
  }
    routing_policy {
    name = "PrivateTrafficPolicy"
    destinations = ["PrivateTraffic"]
    next_hop     = azurerm_palo_alto_virtual_network_appliance.nva_eastus.id
  }
}

resource "azurerm_virtual_hub_routing_intent" "routing_intent_westeurope" {
  name           = var.routing_intent_name_westeurope
  virtual_hub_id = data.terraform_remote_state.connectivity.outputs.westeurope_hub_id

  routing_policy {
    name         = "InternetTrafficPolicy"
    destinations = ["Internet"]
    next_hop     = azurerm_palo_alto_virtual_network_appliance.nva_westeurope.id
  }
    routing_policy {
    name = "PrivateTrafficPolicy"
    destinations = ["PrivateTraffic"]
    next_hop     = azurerm_palo_alto_virtual_network_appliance.nva_westeurope.id
  }
}
