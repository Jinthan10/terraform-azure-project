output "resource_group_name" {
  description = "Azure Resource Group name"
  value       = azurerm_resource_group.terra.name
}

output "vnet_name" {
  description = "Azure Virtual Network name"
  value       = azurerm_virtual_network.terra.name
}

output "linux_vm_name" {
  description = "Linux VM name"
  value       = azurerm_linux_virtual_machine.linux_vm.name
}

output "linux_vm_private_ip" {
  description = "Linux VM private IP address"
  value       = azurerm_network_interface.linux_vm.private_ip_address
}

output "windows_vm_name" {
  description = "Windows VM name"
  value       = azurerm_windows_virtual_machine.windows_vm.name
}

output "windows_vm_private_ip" {
  description = "Windows VM private IP address"
  value       = azurerm_network_interface.windows_vm.private_ip_address
}

output "bastion_name" {
  description = "Azure Bastion name"
  value       = azurerm_bastion_host.terra.name
}
