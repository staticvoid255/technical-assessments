resource "azurerm_virtual_network" "test" {
  name                = "solar-impulse-test"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "subnet-default"
    address_prefix = "10.0.1.0/24"
    security_group = azurerm_network_security_group.main.id
  }

  subnet {
    name           = "subnet-default"
    address_prefix = "10.0.2.0/24"
    security_group = azurerm_network_security_group.main.id
  }

  tags = {
    environment = "Test"
  }
}

resource "azurerm_virtual_network_peering" "test_acc" {
  name                      = "vnet-peering-test-acc"
  resource_group_name       = azurerm_resource_group.main.name
  virtual_network_name      = azurerm_virtual_network.test.name
  remote_virtual_network_id = azurerm_virtual_network.acceptance.id
  //allow_virtual_network_access = true
  //allow_forwarded_traffic      = true
}

resource "azurerm_virtual_network_peering" "acc_test" {
  name                      = "vnet-peering-acc-test"
  resource_group_name       = azurerm_resource_group.main.name
  virtual_network_name      = azurerm_virtual_network.acceptance.name
  remote_virtual_network_id = azurerm_virtual_network.test.id
  //allow_virtual_network_access = true
  //allow_forwarded_traffic      = true
}

resource "azurerm_virtual_network" "acceptance" {
  name                = "solar-impulse-acc"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = ["10.1.0.0/16"]
  dns_servers         = ["10.1.0.4", "10.1.0.5"]

  subnet {
    name           = "subnet-default"
    address_prefix = "10.1.1.0/24"
    security_group = azurerm_network_security_group.main.id
  }

  tags = {
    environment = "Acceptance"
  }
}



