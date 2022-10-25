
resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  kubernetes_version  = data.azurerm_kubernetes_service_versions.current.latest_version
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.cluster_name
  node_resource_group = "${var.cluster_name}-nrg"
        tags                = {
    name = var.cluster_name
  }
    depends_on = [
    azurerm_resource_group.Main_Resource_group
  ] 



  default_node_pool {
    name                = "system"
    #node_count          = var.system_node_count(not required when autoscaling enable)
    vm_size             = "Standard_DS2_v2"
    orchestrator_version = data.azurerm_kubernetes_service_versions.current.latest_version
    type                = "VirtualMachineScaleSets"
    vnet_subnet_id      = azurerm_subnet.subnetA.id
    #availability_zones  =[1,2,3]
    enable_auto_scaling = true
    min_count           = "1"
    max_count           = "3"
    os_disk_size_gb     = "30"

  }

  identity {
    type = "SystemAssigned"
    # or service principal
  }
/*
#Add On Profilees
   addon_profile {
    azure_policy {enabled = true}
    oms_agent {
      enabled = true
      log_analytics_workspace_id = azurerm_log_analytics_workspace.akslogs.id
    }
  }
*/

 # RBAC and Azure AD Integration Block
  /*role_based_access_control {
    enabled = true
    azure_active_directory {
      managed = true
      admin_group_object_ids = [azuread_group.aks_administrators.object_id]
    }
  }*/
  

  network_profile {
    network_plugin    = "azure" 
    service_cidr       = "10.0.0.0/16"
    dns_service_ip     = "10.0.0.10"
    docker_bridge_cidr = "172.17.0.1/16"
  }

}
