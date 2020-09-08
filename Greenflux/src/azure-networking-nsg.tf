resource "azurerm_network_security_group" "nsg_default" {
  name                = var.network_security_group_name
  location            = var.location
  resource_group_name = var.resource_group_name
}