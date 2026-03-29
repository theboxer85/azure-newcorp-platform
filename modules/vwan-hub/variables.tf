#Required variables for virtual wan module

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "vwan_name" {
  type = string
}

variable "hub_name" {
  type = string
}

variable "hub_address_prefix" {
  type = string
}

variable "er_gateway_name" {
  type = string
}

variable "vpn_gateway_name" {
  type = string
}

variable "scale_units" {
  type = number
  default = 1
}

variable "vpn_scale_unit" {
  type = number
  default = 1
}