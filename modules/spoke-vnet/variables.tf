variable "vnet_name" {
  type = string
}

variable "vnet_address_space" {
  type = list(string)
}

variable "workload_subnet_name" {
  type = string
}

variable "workload_subnet_address_prefix" {
  type = string
}

variable "private_endpoint_subnet_name" {
  type = string
}

variable "private_endpoint_subnet_address_prefix" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "hub_connection_name" {
  type = string
}

variable "hub_id" {
  type = string
}