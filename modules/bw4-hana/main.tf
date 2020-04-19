
resource "azurerm_virtual_machine" "bw4hanavm" {
  name                  = "vmdevbw4hana"
  location              = var.location
  resource_group_name   = var.resource_group_name
  vm_size               = "Standard_E16s_v3"
  network_interface_ids = [azurerm_network_interface.nicbw4hana.id]
  availability_set_id   = azurerm_availability_set.avsetbw4hana.id
  tags                  = var.tags

  storage_os_disk {
    name              = "disk-osdevbw4hana"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Premium_LRS"

  }

  storage_image_reference {
    publisher = "RedHat"
    offer     = "RHEL-SAP-HANA"
    sku       = "6.7"
    version   = "latest"
  }

  os_profile {
    computer_name  = "vmdevbw4hana"
    admin_username = "adminuser"
    admin_password = "P@ssw0rd123!"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_network_interface" "nicbw4hana" {
  name                = "nic-vmdevbw4hana"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags


  ip_configuration {
    name                          = "ipnic"
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = var.subnet_id
  }
}

resource "azurerm_managed_disk" "diskbw4hana-1" {
  name                 = "disk-vmdevbw4hana-1"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = "Premium_LRS"
  create_option        = "Empty"
  disk_size_gb         = "64"
  tags                 = var.tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "diskbw4hana-1" {
  managed_disk_id    = azurerm_managed_disk.diskbw4hana-1.id
  virtual_machine_id = azurerm_virtual_machine.bw4hanavm.id
  caching            = "ReadWrite"
  lun                = 10
}

resource "azurerm_managed_disk" "diskbw4hana-2" {
  name                 = "disk-vmdevbw4hana-2"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = "Premium_LRS"
  create_option        = "Empty"
  disk_size_gb         = "64"
  tags                 = var.tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "diskbw4hana-2" {
  managed_disk_id    = azurerm_managed_disk.diskbw4hana-2.id
  virtual_machine_id = azurerm_virtual_machine.bw4hanavm.id
  caching            = "ReadWrite"
  lun                = 11
}


resource "azurerm_managed_disk" "diskbw4hanadata-1" {
  name                 = "disk-vmdevbw4hanadata-1"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = "Premium_LRS"
  create_option        = "Empty"
  disk_size_gb         = "256"
  tags                 = var.tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "diskbw4hanadata-1" {
  managed_disk_id    = azurerm_managed_disk.diskbw4hanadata-1.id
  virtual_machine_id = azurerm_virtual_machine.bw4hanavm.id
  caching            = "ReadWrite"
  lun                = 12
}

resource "azurerm_managed_disk" "diskbw4hanadata-2" {
  name                 = "disk-vmdevbw4hanadata-2"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = "Premium_LRS"
  create_option        = "Empty"
  disk_size_gb         = "256"
  tags                 = var.tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "diskbw4hanadata-2" {
  managed_disk_id    = azurerm_managed_disk.diskbw4hanadata-2.id
  virtual_machine_id = azurerm_virtual_machine.bw4hanavm.id
  caching            = "ReadWrite"
  lun                = 13
}

resource "azurerm_managed_disk" "diskbw4hanadata-3" {
  name                 = "disk-vmdevbw4hanadata-3"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = "Premium_LRS"
  create_option        = "Empty"
  disk_size_gb         = "256"
  tags                 = var.tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "diskbw4hanadata-3" {
  managed_disk_id    = azurerm_managed_disk.diskbw4hanadata-3.id
  virtual_machine_id = azurerm_virtual_machine.bw4hanavm.id
  caching            = "ReadWrite"
  lun                = 14
}

resource "azurerm_managed_disk" "diskbw4hanalog-1" {
  name                 = "disk-vmdevbw4hanalog-1"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = "Premium_LRS"
  create_option        = "Empty"
  disk_size_gb         = "256"
  tags                 = var.tags

}

resource "azurerm_virtual_machine_data_disk_attachment" "diskbw4hanalog-1" {
  managed_disk_id    = azurerm_managed_disk.diskbw4hanalog-1.id
  virtual_machine_id = azurerm_virtual_machine.bw4hanavm.id
  caching            = "ReadWrite"
  lun                = 15
}

resource "azurerm_managed_disk" "diskbw4hanalog-2" {
  name                 = "disk-vmdevbw4hanalog-2"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = "Premium_LRS"
  create_option        = "Empty"
  disk_size_gb         = "256"
  tags                 = var.tags

}

resource "azurerm_virtual_machine_data_disk_attachment" "diskbw4hanalog-2" {
  managed_disk_id    = azurerm_managed_disk.diskbw4hanalog-2.id
  virtual_machine_id = azurerm_virtual_machine.bw4hanavm.id
  caching            = "ReadWrite"
  lun                = 16
}

resource "azurerm_managed_disk" "diskbw4hanashared-1" {
  name                 = "disk-vmdevbw4hanashared-1"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = "Premium_LRS"
  create_option        = "Empty"
  disk_size_gb         = "256"
  tags                 = var.tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "diskbw4hanashared-1" {
  managed_disk_id    = azurerm_managed_disk.diskbw4hanashared-1.id
  virtual_machine_id = azurerm_virtual_machine.bw4hanavm.id
  caching            = "ReadWrite"
  lun                = 17
}

resource "azurerm_managed_disk" "diskbw4hanabackup-1" {
  name                 = "disk-vmdevbw4hanabackup-1"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = "Premium_LRS"
  create_option        = "Empty"
  disk_size_gb         = "256"
  tags                 = var.tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "diskbw4hanabackup-1" {
  managed_disk_id    = azurerm_managed_disk.diskbw4hanabackup-1.id
  virtual_machine_id = azurerm_virtual_machine.bw4hanavm.id
  caching            = "ReadWrite"
  lun                = 18
}

resource "azurerm_availability_set" "avsetbw4hana" {
  name                         = "avset-bw4hana"
  location                     = var.location
  resource_group_name          = var.resource_group_name
  platform_update_domain_count = 5
  platform_fault_domain_count  = 3
  managed                      = true
  proximity_placement_group_id = var.proximity_placement_group
  tags                         = var.tags
}
