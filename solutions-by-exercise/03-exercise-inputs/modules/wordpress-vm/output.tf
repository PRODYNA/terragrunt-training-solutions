output "vm_public_ips" {
  value = azurerm_linux_virtual_machine.vm[*].public_ip_address
}