resource "azurerm_virtual_machine" "solmanabapvm" {
  name                         = "vmdevsolmanabap"
  location                     = var.location
  resource_group_name          = var.resource_group_name
  vm_size                      = "Standard_E4s_v3"
  network_interface_ids        = [azurerm_network_interface.nicsolmanabap.id]
  availability_set_id          = azurerm_availability_set.avsetsolmanabap.id
  tags                         = var.tags

  storage_os_disk {
    name              = "disk-osvmdevsolmanabap"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Premium_LRS"

  }

  storage_image_reference {
    publisher = "RedHat"
    offer     = "RHEL-SAP"
    sku       = "7.5"
    version   = "latest"
  }


  os_profile {
    computer_name  = "vmdevsolmanabap"
    admin_username = "adminuser"
    admin_password = "P@ssw0rd123!"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_network_interface" "nicsolmanabap" {
  name                = "nic-vmdevsolmanabap"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags

  ip_configuration {
    name                          = "ipnic"
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = var.subnet_id
  }
}

resource "azurerm_managed_disk" "disksolmanabap-1" {
  name                 = "disk-vmdevsolmanabap-1"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = "Premium_LRS"
  create_option        = "Empty"
  disk_size_gb         = "256"
  tags                 = var.tags

}

resource "azurerm_virtual_machine_data_disk_attachment" "disksolmanabap-1" {
  managed_disk_id    = azurerm_managed_disk.disksolmanabap-1.id
  virtual_machine_id = azurerm_virtual_machine.solmanabapvm.id
  caching            = "ReadWrite"
  lun                = 10
}

resource "azurerm_availability_set" "avsetsolmanabap" {
  name                         = "avset-solmanabap"
  location                     = var.location
  resource_group_name          = var.resource_group_name
  platform_update_domain_count = 5
  platform_fault_domain_count  = 3
  managed                      = true
  proximity_placement_group_id = var.proximity_placement_group
  tags                         = var.tags  
}
