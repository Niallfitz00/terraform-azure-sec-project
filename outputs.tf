output "vm_public_ip" {
  value       = azurerm_public_ip.pip_vm.ip_address
  description = "The public IP address of the VM"
}

output "nsg_name" {
  value       = azurerm_network_security_group.nsg_web.name
  description = "Network Security Group applied to the subnet"
}
