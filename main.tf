resource "azurerm_linux_virtual_machine" "linux_vm" {
  name                = "linux-vm"
  resource_group_name = azurerm_resource_group.terra.name
  location            = azurerm_resource_group.terra.location
  size                = "Standard_B1ms"

  admin_username                  = "azureadmin"
  admin_password                  = "admin@1234"
  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.private_id.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "server"
    version   = "latest"
  }
}

resource "azurerm_windows_virtual_machine" "windows_vm" {
  name                = "windows-vm"
  resource_group_name = azurerm_resource_group.terra.name
  location            = azurerm_resource_group.terra.location
  size                = "Standard_B1ms"

  admin_username = "azureadmin"
  admin_password = "admin@1234"

  network_interface_ids = [
    azurerm_network_interface.vm2.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-datacenter-azure-edition"
    version   = "latest"
  }
}