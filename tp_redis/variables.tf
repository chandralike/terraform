variable "location" {
  type = string
  description = "name of the resource location."
}
variable "resource_group_name" {
  type = string
  description = "name of the resource name."
}
variable "resource_group_name2" {
  type = string
  description = "name of the resource name."
}
variable "storage_account_name" {
  type = string
  description = "This variable defines the storage account name"
}
variable "storage_account_name2" {
  type = string
  description = "This variable defines the storage account name"
}

variable "storage_container_name" {
  type = string
  description = "This variable defines the storage account name"
}
variable "storage_container_name2" {
  type = string
  description = "This variable defines the storage account name"
}
variable "virtual_network_name" {
     type = string
  description = "This variable defines the virtual_network name"
}
variable "virtual_network_address_space" {
     type = string
  description = "This variable defines the virtual_network address_space"
}
variable "subnet_name" {
     type = string
  description = "This variable defines the subnet name"
}
variable "subnet_address_space" {
     type = string
  description = "This variable defines the subnet address_space"
}
variable "subnet_name2" {
     type = string
  description = "This variable defines the subnet name"
}
variable "subnet_address_space2" {
     type = string
  description = "This variable defines the subnet address_space"
}
variable "subnet_name3" {
     type = string
  description = "This variable defines the subnet name"
}
variable "subnet_address_space3" {
     type = string
  description = "This variable defines the subnet address_space"
}
variable "subnet_name4" {
     type = string
  description = "This variable defines the subnet name"
}
variable "subnet_address_space4" {
     type = string
  description = "This variable defines the subnet address_space"
}
variable "subnet_name5" {
     type = string
  description = "This variable defines the subnet name"
}
variable "subnet_address_space5" {
     type = string
  description = "This variable defines the subnet address_space"
}
variable "network_interface_name" {
     type = string
  description = "This variable defines the network_interface name"
}
variable "public_ip_name" {
     type = string
  description = "This variable defines the public_ip name"
}
variable "acr_name" {
	type = string
  	description = "this defines name of acr"
}
variable "log_analytics_workspace_name" {
	type = string
  	description = "this defines name of log_analytics_workspace"
}
variable "log_analytics_solution_name" {
	type = string
  	description = "this defines name of log_analytics_solution"
}
variable "cluster_name" {
	type = string
  	description = "this defines name of kubernetes_cluster"
}
variable "kubernetes_version" {
    type = string
    description = "k8s version"
}
variable "system_node_count" {
    type = string
    description = "number of worker nodes"
}
