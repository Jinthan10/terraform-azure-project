resource "azurerm_virtual_network" "terra" {
  name                = "terrabite-vnet"
  location            = azurerm_resource_group.terra.location
  resource_group_name = azurerm_resource_group.terra.name
  address_space = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "terra" {
  name                 = "terrabite-subnet"
  resource_group_name  = azurerm_resource_group.terra.name
  virtual_network_name = azurerm_virtual_network.terra.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "private" {
  name                 = "terrabite-private-subnet"
  resource_group_name  = azurerm_resource_group.terra.name
  virtual_network_name = azurerm_virtual_network.terra.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_subnet" "bastion" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.terra.name
  virtual_network_name = azurerm_virtual_network.terra.name
  address_prefixes     = ["10.0.3.0/26"]
}
