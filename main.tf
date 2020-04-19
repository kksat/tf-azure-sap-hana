provider "azurerm" {
  version = "=2.0.0"
  features {}
}

locals {
  tags = {
    Environment = var.environment
    SLA         = var.sla
    Created_by  = var.created_by
    Created_at  = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
  }
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = local.tags
}


resource "azurerm_proximity_placement_group" "ppg" {
  name                = "ppg-default"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = local.tags
}

module "network" {
  source                = "./modules/network"
  location              = var.location
  resource_group_name   = azurerm_resource_group.rg.name
  address_space         = [var.address_space]
  subnet_prefix         = var.subnet_prefix
  backend_subnet_prefix = var.backend_subnet_prefix
  #remote_virtual_network_id = var.remote_virtual_network_id
  tags = local.tags
}


module "bods" {
  source                    = "./modules/bods"
  location                  = var.location
  resource_group_name       = azurerm_resource_group.rg.name
  subnet_id                 = module.network.subnet_front
  proximity_placement_group = azurerm_proximity_placement_group.ppg.id
  tags                      = local.tags
}

module "bw4-app" {
  source                    = "./modules/bw4-app"
  location                  = var.location
  resource_group_name       = azurerm_resource_group.rg.name
  subnet_id                 = module.network.subnet_front
  proximity_placement_group = azurerm_proximity_placement_group.ppg.id
  tags                      = local.tags
}

module "bw4-hana" {
  source                    = "./modules/bw4-hana"
  location                  = var.location
  resource_group_name       = azurerm_resource_group.rg.name
  subnet_id                 = module.network.subnet_front
  proximity_placement_group = azurerm_proximity_placement_group.ppg.id
  tags                      = local.tags
}

module "cpi" {
  source                    = "./modules/cpi"
  location                  = var.location
  resource_group_name       = azurerm_resource_group.rg.name
  subnet_id                 = module.network.subnet_front
  proximity_placement_group = azurerm_proximity_placement_group.ppg.id
  tags                      = local.tags
}

module "file-server" {
  source                    = "./modules/file-server"
  location                  = var.location
  resource_group_name       = azurerm_resource_group.rg.name
  subnet_id                 = module.network.subnet_front
  proximity_placement_group = azurerm_proximity_placement_group.ppg.id
  tags                      = local.tags
}

module "hcc" {
  source                    = "./modules/hcc"
  location                  = var.location
  resource_group_name       = azurerm_resource_group.rg.name
  subnet_id                 = module.network.subnet_front
  proximity_placement_group = azurerm_proximity_placement_group.ppg.id
  tags                      = local.tags
}

module "po-app" {
  source                    = "./modules/po-app"
  location                  = var.location
  resource_group_name       = azurerm_resource_group.rg.name
  subnet_id                 = module.network.subnet_front
  proximity_placement_group = azurerm_proximity_placement_group.ppg.id
  tags                      = local.tags
}

module "slt" {
  source                    = "./modules/slt"
  location                  = var.location
  resource_group_name       = azurerm_resource_group.rg.name
  subnet_id                 = module.network.subnet_front
  proximity_placement_group = azurerm_proximity_placement_group.ppg.id
  tags                      = local.tags
}

module "solman-abap" {
  source                    = "./modules/solman-abap"
  location                  = var.location
  resource_group_name       = azurerm_resource_group.rg.name
  subnet_id                 = module.network.subnet_front
  proximity_placement_group = azurerm_proximity_placement_group.ppg.id
  tags                      = local.tags
}

module "solman-java" {
  source                    = "./modules/solman-java"
  location                  = var.location
  resource_group_name       = azurerm_resource_group.rg.name
  subnet_id                 = module.network.subnet_front
  proximity_placement_group = azurerm_proximity_placement_group.ppg.id
  tags                      = local.tags
}

module "solman-mdc-po" {
  source                    = "./modules/solman-mdc-po"
  location                  = var.location
  resource_group_name       = azurerm_resource_group.rg.name
  subnet_id                 = module.network.subnet_front
  proximity_placement_group = azurerm_proximity_placement_group.ppg.id
  tags                      = local.tags
}

module "web-dispatcher" {
  source                    = "./modules/web-dispatcher"
  location                  = var.location
  resource_group_name       = azurerm_resource_group.rg.name
  subnet_id                 = module.network.subnet_front
  proximity_placement_group = azurerm_proximity_placement_group.ppg.id
  tags                      = local.tags
}
