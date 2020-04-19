
variable "resource_group_name" {
  default = "rg-sap-dev-001"
}

variable "location" {
  default = "eastus2"
}

variable "address_space" {
  description = "IP da virtual network"
  default     = "172.27.255.128/25"
}

variable "subnet_prefix" {
  description = "IP da Subnet"
  default     = "172.27.255.128/27"
}

variable "backend_subnet_prefix" {
  description = "IP da Subnet"
  default     = "172.27.255.192/27"
}
/*
variable "remote_virtual_network_id" {
  description = "digitar aqui"
  default     = "/subscriptions/fb2e7492-9d1e-4f0d-8e48-55a0fedd2233/resourceGroups/rg-network-hml-02/providers/Microsoft.Network/virtualNetworks/vnet-hub-hml-eastus2-01"
}*/

variable "environment" {
  description ="Tipo do ambiente, ex: Dev, Prod ou Hml"
  default = "dev"
  
}
variable "sla" {
  description ="Tipo do SLA, ex: Alto, Medio, Baixo"
  default = "alto"
}
variable "created_by" {
  description ="Criado por: Digite seu nome"
  default = "Gabriel"
}

