resource "azurerm_virtual_network" "myrg-vnet" {
  name                = "sai-vnet"
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]



  tags = {
    environment = "Production"
  }
}

resource "azurerm_subnet" "bastion" {
  name                 = "sai-bastion-subnet"
  resource_group_name  = azurerm_resource_group.myrg.name
  virtual_network_name = azurerm_virtual_network.myrg-vnet.name
  address_prefixes     = ["10.0.1.0/24"]
 }

 resource "azurerm_subnet" "web" {
  name                 = "sai-web-subnet"
  resource_group_name  = azurerm_resource_group.myrg.name
  virtual_network_name = azurerm_virtual_network.myrg-vnet.name
  address_prefixes     = ["10.0.15.0/24"]
 }

  resource "azurerm_subnet" "App" {
  name                 = "sai-App-subnet"
  resource_group_name  = azurerm_resource_group.myrg.name
  virtual_network_name = azurerm_virtual_network.myrg-vnet.name
  address_prefixes     = ["10.0.20.0/24"]
 }

  resource "azurerm_subnet" "db" {
  name                 = "sai-db-subnet"
  resource_group_name  = azurerm_resource_group.myrg.name
  virtual_network_name = azurerm_virtual_network.myrg-vnet.name
  address_prefixes     = ["10.0.25.0/24"]
 }
