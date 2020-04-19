resource "azurerm_virtual_machine" "mdcposolmanvm" {
  name                  = "vmdevmdcposolman"
  location              = var.location
  resource_group_name   = var.resource_group_name
  vm_size               = "Standard_E64s_v3"
  network_interface_ids = [azurerm_network_interface.nicmdcposolman.id]
  availability_set_id   = azurerm_availability_set.avsetmdcposolman.id
  tags                  = var.tags

  storage_os_disk {
    name              = "disk-osvmmdcposolman"
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
    computer_name  = "vmdevmdcposolman"
    admin_username = "adminuser"
    admin_password = "P@ssw0rd123!"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_network_interface" "nicmdcposolman" {
  name                = "nic-vmdevmdcposolman-001"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags

  ip_configuration {
    name                          = "ipnic"
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = var.subnet_id
  }
}

resource "azurerm_managed_disk" "diskmdcposolman-1" {
  name                 = "disk-vmdevmdcposolman-1"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = "Premium_LRS"
  create_option        = "Empty"
  disk_size_gb         = "64"
  tags                 = var.tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "diskmdcposolman-1" {
  managed_disk_id    = azurerm_managed_disk.diskmdcposolman-1.id
  virtual_machine_id = azurerm_virtual_machine.mdcposolmanvm.id
  caching            = "ReadWrite"
  lun                = 10
}

resource "azurerm_managed_disk" "diskmdcposolman-2" {
  name                 = "disk-vmdevmdcposolman-2"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = "Premium_LRS"
  create_option        = "Empty"
  disk_size_gb         = "64"
  tags                 = var.tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "diskmdcposolman-2" {
  managed_disk_id    = azurerm_managed_disk.diskmdcposolman-2.id
  virtual_machine_id = azurerm_virtual_machine.mdcposolmanvm.id
  caching            = "ReadWrite"
  lun                = 11
}

resource "azurerm_managed_disk" "diskmdcposolmandata-1" {
  name                 = "disk-vmdevmdcposolmandata-1"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = "Premium_LRS"
  create_option        = "Empty"
  disk_size_gb         = "256"
  tags                 = var.tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "diskmdcposolmandata-1" {
  managed_disk_id    = azurerm_managed_disk.diskmdcposolmandata-1.id
  virtual_machine_id = azurerm_virtual_machine.mdcposolmanvm.id
  caching            = "ReadWrite"
  lun                = 12
}

resource "azurerm_managed_disk" "diskmdcposolmandata-2" {
  name                 = "disk-vmdevmdcposolmandata-2"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = "Premium_LRS"
  create_option        = "Empty"
  disk_size_gb         = "256"
  tags                 = var.tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "diskmdcposolmandata-2" {
  managed_disk_id    = azurerm_managed_disk.diskmdcposolmandata-2.id
  virtual_machine_id = azurerm_virtual_machine.mdcposolmanvm.id
  caching            = "ReadWrite"
  lun                = 13
}

resource "azurerm_managed_disk" "diskmdcposolmandata-3" {
  name                 = "disk-vmdevmdcposolmandata-3"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = "Premium_LRS"
  create_option        = "Empty"
  disk_size_gb         = "256"
  tags                 = var.tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "diskmdcposolmandata-3" {
  managed_disk_id    = azurerm_managed_disk.diskmdcposolmandata-3.id
  virtual_machine_id = azurerm_virtual_machine.mdcposolmanvm.id
  caching            = "ReadWrite"
  lun                = 14
}

resource "azurerm_managed_disk" "diskmdcposolmanlog-1" {
  name                 = "disk-vmdevmdcposolmanlog-1"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = "Premium_LRS"
  create_option        = "Empty"
  disk_size_gb         = "256"
  tags                 = var.tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "diskmdcposolmanlog-1" {
  managed_disk_id    = azurerm_managed_disk.diskmdcposolmanlog-1.id
  virtual_machine_id = azurerm_virtual_machine.mdcposolmanvm.id
  caching            = "ReadWrite"
  lun                = 15
}

resource "azurerm_managed_disk" "diskmdcposolmanlog-2" {
  name                 = "disk-vmdevmdcposolmanlog-2"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = "Premium_LRS"
  create_option        = "Empty"
  disk_size_gb         = "256"
  tags                 = var.tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "diskmdcposolmanlog-2" {
  managed_disk_id    = azurerm_managed_disk.diskmdcposolmanlog-2.id
  virtual_machine_id = azurerm_virtual_machine.mdcposolmanvm.id
  caching            = "ReadWrite"
  lun                = 16
}

resource "azurerm_managed_disk" "diskmdcposolmanshared-1" {
  name                 = "disk-vmdevmdcposolmanshared-1"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = "Premium_LRS"
  create_option        = "Empty"
  disk_size_gb         = "256"
  tags                 = var.tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "diskmdcposolmanshared-1" {
  managed_disk_id    = azurerm_managed_disk.diskmdcposolmanshared-1.id
  virtual_machine_id = azurerm_virtual_machine.mdcposolmanvm.id
  caching            = "ReadWrite"
  lun                = 17
}

resource "azurerm_managed_disk" "diskmdcposolmanbackup-1" {
  name                 = "disk-vmdevmdcposolmanbackup-1"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = "Premium_LRS"
  create_option        = "Empty"
  disk_size_gb         = "256"
  tags                 = var.tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "diskmdcposolmanbackup-1" {
  managed_disk_id    = azurerm_managed_disk.diskmdcposolmanbackup-1.id
  virtual_machine_id = azurerm_virtual_machine.mdcposolmanvm.id
  caching            = "ReadWrite"
  lun                = 18
}

resource "azurerm_availability_set" "avsetmdcposolman" {
  name                         = "avail-vmmdcposolman"
  location                     = var.location
  resource_group_name          = var.resource_group_name
  platform_update_domain_count = 5
  platform_fault_domain_count  = 3
  managed                      = true
  proximity_placement_group_id = var.proximity_placement_group
  tags                         = var.tags
}
