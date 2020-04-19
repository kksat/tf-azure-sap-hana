resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-sapdev-eastus2-001"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  tags                = var.tags

}
resource "azurerm_subnet" "subnet_frontend" {
  name                      = "snet-frontend"
  virtual_network_name      = azurerm_virtual_network.vnet.name
  resource_group_name       = var.resource_group_name
  address_prefix            = var.subnet_prefix
  
}
resource "azurerm_subnet" "subnet_backend" {
  name                      = "snet-backend"
  virtual_network_name      = azurerm_virtual_network.vnet.name
  resource_group_name       = var.resource_group_name
  address_prefix            = var.backend_subnet_prefix

}

resource "azurerm_public_ip" "pip" {
  name                = "pip-eastus2-001"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
  tags                = var.tags
}

resource "azurerm_network_security_group" "nsg_frontend" {
  name                = "nsg-frontend"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
  }

resource "azurerm_subnet_network_security_group_association" "subnet_frontnsg" {
  subnet_id = azurerm_subnet.subnet_frontend.id
  network_security_group_id = azurerm_network_security_group.nsg_frontend.id
}


resource "azurerm_network_security_group" "nsg_backend" {
  name                = "nsg-backend"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}
