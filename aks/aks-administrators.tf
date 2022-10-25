/*
# Create Azure AD Group in Active Directory for AKS Admins
resource "azuread_group" "aks_administrators" {
  name        = "aks_administrators"
  description = "Azure AKS Kubernetes administrators for the ${ azurerm_resource_group.Main_Resource_group.name}-cluster."
}
*/

#  name        = "${azurerm_resource_group.Main_Resource_group.name}-cluster-administrators"

