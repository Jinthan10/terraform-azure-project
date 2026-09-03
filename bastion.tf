resource "azurerm_public_ip" "bastion" {
  name                = "terrabite-bastion-ip"
  location            = azurerm_resource_group.terra.location
  resource_group_name = azurerm_resource_group.terra.name

  allocation_method = "Static"
  sku               = "Standard"
}

resource "azurerm_bastion_host" "terra" {
  name                = "terrabite-bastion"
  location            = azurerm_resource_group.terra.location
  resource_group_name = azurerm_resource_group.terra.name

  ip_configuration {
    name                 = "bastion-ip-config"
    subnet_id            = azurerm_subnet.bastion.id
    public_ip_address_id = azurerm_public_ip.bastion.id
  }
}
