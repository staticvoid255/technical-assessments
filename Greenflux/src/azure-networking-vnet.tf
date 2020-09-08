resource "azurerm_virtual_network" "test" {
  name                = "solar-impulse-test"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "subnet-default"
    address_prefix = "10.0.1.0/24"
    security_group = azurerm_network_security_group.nsg_default.id
  }

  subnet {
    name           = "subnet-default"
    address_prefix = "10.0.2.0/24"
    security_group = azurerm_network_security_group.nsg_default.id
  }

  tags = {
    environment = "Test"
  }
}

resource "azurerm_virtual_network_gateway" "test" {
  name                = "test-gateway"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  type     = "Vpn"
  vpn_type = "RouteBased"
  sku      = "Basic"

  ip_configuration {
    public_ip_address_id          = azurerm_public_ip.us.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.us_gateway.id
  }
}

resource "azurerm_virtual_network" "vnet_acc" {
  name                = "solar-impulse-acc"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = ["10.1.0.0/16"]
  dns_servers         = ["10.1.0.4", "10.1.0.5"]

  subnet {
    name           = "subnet-default"
    address_prefix = "10.1.1.0/24"
    security_group = azurerm_network_security_group.nsg_default.id
  }

  tags = {
    environment = "Acceptance"
  }
}



