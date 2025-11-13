# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "${random_pet.prefix.id}-rg"
  location = "Central India"
}

resource "azurerm_storage_account" "storagerg" {
 name = "${substr(replace(random_pet.prefix.id, "-", ""), 0, 12)}stg"
 resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  account_tier = "Standard"
  account_replication_type = "LRS"

tags = {
  environment="Staging"
}
}

resource "random_pet" "prefix" {
    prefix = "terraform-learn"
    length = 1
  }