resource "azurerm_virtual_machine" "WebDispatchervm" {
  name                  = "vmdevwebdispatcher"
  location              = var.location
  resource_group_name   = var.resource_group_name
  vm_size               = "Standard_D2s_v3"
  network_interface_ids = [azurerm_network_interface.nicWebDispatcher.id]
  availability_set_id   = azurerm_availability_set.avsetWebDispatcher.id
  tags                  = var.tags

  storage_os_disk {
    name              = "disk-osvmwebdispatcher"
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
    computer_name  = "vmdevwebdispatcher"
    admin_username = "adminuser"
    admin_password = "P@ssw0rd123!"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_network_interface" "nicWebDispatcher" {
  name                = "nic-vmdevwebdispatcher-001"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags

  ip_configuration {
    name                          = "ipnic"
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = var.subnet_id
  }
}

resource "azurerm_managed_disk" "diskWebDispatcher-1" {
  name                 = "disk-vmdevwebdispatcher-1"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = "Premium_LRS"
  create_option        = "Empty"
  disk_size_gb         = "256"
  tags                 = var.tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "diskWebDispatcher-1" {
  managed_disk_id    = azurerm_managed_disk.diskWebDispatcher-1.id
  virtual_machine_id = azurerm_virtual_machine.WebDispatchervm.id
  caching            = "ReadWrite"
  lun                = 10
}

resource "azurerm_availability_set" "avsetWebDispatcher" {
  name                         = "avail-vmwebdispatcher"
  location                     = var.location
  resource_group_name          = var.resource_group_name
  platform_update_domain_count = 5
  platform_fault_domain_count  = 3
  managed                      = true
  proximity_placement_group_id = var.proximity_placement_group
  tags                         = var.tags
}
