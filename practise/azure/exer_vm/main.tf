resource "azurerm_resource_group" "resgr1" {
  name     = var.rg1
  location = var.location
}

resource "azurerm_virtual_network" "vn1" {
  name                = var.vn1
  location            = azurerm_resource_group.resgr1.location
  resource_group_name = azurerm_resource_group.resgr1.name
  address_space       = ["10.0.0.0/16"]
  subnet {
    name             = "subnet1"
    address_prefixes = ["10.0.0.0/24"]
  }
  subnet {
    name             = "subnet2"
    address_prefixes = ["10.0.1.0/24"]
  }
}
