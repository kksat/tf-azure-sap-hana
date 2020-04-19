variable "resource_group_name" {}
variable "location" {}


resource "azurerm_virtual_machine" "bods-vm" {
  name                            = "bods-vm-01"
  location                        = "${var.location}"
  resource_group_name             = "${var.resource_group_name}"
  size                            = "Standard_D4s_v3"
  disable_password_authentication = false
  network_interface_ids           = "${azurerm_network_interface.nicbods.id}"

  storage_os_disk {
    name              = "bodsdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }


  os_profile {
    computer_name  = "bods01"
    admin_username = "adminuser"
    admin_password = "P@ssw0rd123!"
  }

  os_profile_linux_config {
    disable_password_authentication = true
  }
}

resource "azurerm_network_interface" "nicbods" {
  name                = "nic_bods"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"


  ip_configuration {
    name                          = "ipnic"
    private_ip_address_allocation = "Dynamic"
    
  }

}
