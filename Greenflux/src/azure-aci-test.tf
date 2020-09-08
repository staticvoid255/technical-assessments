resource "azurerm_container_group" "aci_cg_test" {
  name                = "aci-cg-test"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  ip_address_type     = "public"
  dns_name_label      = "aci-test"
  os_type             = "Linux"

  container {
    name   = "hello-world"
    image  = "strm/dnsmasq:latest"
    cpu    = "1"
    memory = "2"

    environment_variables = {
        "server": "8.8.8.8",
        "server": "8.8.4.4"
    } 

    secure_environment_variables = {} //Use for sensitive data

    ports {
      port     = 53 //Port 53 also specified in Dockerfile
      protocol = "UDP"
    }
  }

  tags = {
    environment = "Test"
  }
}