terraform {
  backend "azurerm" {
    resource_group_name  = "cloud-shell-storage-centralindia"
    storage_account_name = "csg10032003d0946a7c"
    container_name       = "store1"
    key                  = "default.tfstate"
  }
}
