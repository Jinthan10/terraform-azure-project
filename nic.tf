resource "azurerm_network_interface" "private_id" {
  name                = "terrabite-nic-vm1"
  location            = azurerm_resource_group.terra.location
  resource_group_name = azurerm_resource_group.terra.name
  ip_configuration {
    name                          = "internal_vm1"
    subnet_id                     = azurerm_subnet.terra.id
    private_ip_address_allocation = "Dynamic"
  }
}
resource "azurerm_network_interface" "vm2" {
  name                = "terrabite-nic-vm2"
  location            = azurerm_resource_group.terra.location
  resource_group_name = azurerm_resource_group.terra.name
  ip_configuration {
    name                          = "internal_vm2"
    subnet_id                     = azurerm_subnet.private.id
    private_ip_address_allocation = "Dynamic"

  }
}