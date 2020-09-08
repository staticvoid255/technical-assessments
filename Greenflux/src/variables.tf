// This file for generic, reusable variables - keep resource-specific ones with the resource itself

variable "location" {
  type    = string
  default = "West Europe"
}

variable "resource_group_name" {
  type    = string
  default = "YOUR_RESOURCE_GROUP_NAME_HERE"
}

variable "network_security_group_name" {
  type    = string
  default = "YOUR_NSG_NAME_HERE"
}