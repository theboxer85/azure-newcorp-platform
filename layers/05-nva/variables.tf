variable "nva_name_eastus" {
  type = string
}

variable "nva_name_westeurope" {
  type = string
}

variable "ngfw_name_eastus" {
  type = string
}

variable "ngfw_name_westeurope" {
  type = string
}

variable "routing_intent_name_eastus" {
  type = string
}

variable "routing_intent_name_westeurope" {
  type = string
}

variable "location_eastus" {
  type = string
}

variable "location_westeurope" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "panorama_base64_config" {
  type = string
  sensitive = true
}