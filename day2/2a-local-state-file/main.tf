provider "azurerm" {
  subscription_id = "40475c2e-43f3-4503-a6b5-5fd98540a7ff"
  client_id       = "9b973ded-ebb7-4a20-b40d-4e6424c35f1b"
  client_secret   = "ARV8Q~havNHqYEbPtHiCySnsFwon-aLbpBg5LdgM"
  tenant_id       = "c86f0a23-74f2-4709-a702-e648a11e2aa2"
  features {}
}

resource "azurerm_resource_group" "example" {
  name                      = local.resource_group_name
  location                  = var.location
}

resource "azurerm_storage_account" "example" {
  name                      = local.storage_account_name
  resource_group_name       = azurerm_resource_group.example.name
  location                  = var.location
  account_tier              = "Standard"
  account_replication_type  = "LRS"
}

resource "azurerm_servicebus_namespace" "example" {
  name                      = local.servicebus_namespace_name
  location                  = var.location
  resource_group_name       = azurerm_resource_group.example.name
  sku                       = "Standard"
}