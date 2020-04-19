output "subnet_front" {
  value = "${azurerm_subnet.subnet_frontend.id}"
}

output "subnet_back" {
  value = "${azurerm_subnet.subnet_backend.id}"
}