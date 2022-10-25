

variable "location" {
  type = string
  description = "Azure Region where all these resources will be provisioned"
  default = "North Europe"
}

# Azure Resource Group Name
variable "resource_group_name" {
  type = string
  description = "This variable defines the Resource Group"
  default = "app-grp"
}

variable "storage_account_name" {
  type = string
  description = "This variable defines the storage account name"
  default = "storage1509"
}

variable "storage_container_name" {
  type = string
  description = "This variable defines the storage account name"
  default = "tpdata"
}

variable "virtual_network" {
     type = string
  description = "This variable defines the virtual_network name"
  default = "appnetwork"
}
variable "virtual_network_address_space" {
     type = string
  description = "This variable defines the virtual_network address_space"
  default = "10.0.0.0/16"
}

variable "network_interface" {
     type = string
  description = "This variable defines the virtual_interface name"
  default = "appinterface"
}

variable "network_security_group" {
     type = string
  description = "This variable defines the network_security_group name"
  default = "appnsg"
}
variable "network_subnet_network_security_group_association" {
     type = string
  description = "This variable defines the network_security_group associtation"
  default = "appnsglink"
}

variable "public_ip" {
     type = string
  description = "This variable defines the public ip "
  default = "app-ip"
}