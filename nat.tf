resource "azurerm_public_ip" "nat" {
  name                = "terrabite-nat-public-ip"
  location            = azurerm_resource_group.terra.location
  resource_group_name = azurerm_resource_group.terra.name

  allocation_method = "Static"
  sku               = "Standard"
}

resource "azurerm_nat_gateway" "terra" {
  name                = "terrabite-nat-gateway"
  location            = azurerm_resource_group.terra.location
  resource_group_name = azurerm_resource_group.terra.name

  sku_name = "Standard"
}

resource "azurerm_nat_gateway_public_ip_association" "terra" {
  nat_gateway_id       = azurerm_nat_gateway.terra.id
  public_ip_address_id = azurerm_public_ip.nat.id
}

resource "azurerm_subnet_nat_gateway_association" "private" {
  subnet_id      = azurerm_subnet.private.id
  nat_gateway_id = azurerm_nat_gateway.terra.id
}
