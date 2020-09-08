resource "azurerm_virtual_network" "vnet_test" {
  name                = "solar-impulse-test"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "subnet-default"
    address_prefix = "10.0.3.0/24"
    security_group = azurerm_network_security_group.nsg_default.id
  }

  tags = {
    environment = "Test"
  }
}

resource "azurerm_virtual_network" "vnet_acc" {
  name                = "solar-impulse-acc"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "subnet-default"
    address_prefix = "10.0.3.0/24"
    security_group = azurerm_network_security_group.nsg_default.id
  }

  tags = {
    environment = "Acceptance"
  }
}

