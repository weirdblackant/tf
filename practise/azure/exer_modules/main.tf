module "azurerm_resource_group" {
  source   = "./modules/virtn/"
  rg_name  = "${var.rgname}${count.index+1}"
  location = var.location
  count    = 3
}
