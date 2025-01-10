terraform{
  #Declarationofstatefilestorage
  backend "azurerm" {
    resource_group_name   = "kube"
    storage_account_name  = "terastorage78956"
    container_name        = "tfstate"
    key                   = "terraform.tfstate"
  }
}
