resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.26.0"
    }
  }
}