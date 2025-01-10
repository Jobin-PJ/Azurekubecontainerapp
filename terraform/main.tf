  terraform {
    required_providers {
      azurerm = {
        source  = "hashicorp/azurerm"
        version = "=4.1.0"
      }
    }
  }
  
  provider "azurerm" {
    features {}
  }
  
  #DeclaretheResourceGroupfirst
  resource "azurerm_resource_group" "r-grp" {
    name     = "kube"
    location = "East US"
  }

    #Declarationofstatefilestorage
  backend "azurerm" {
    resource_group_name   = "kube"
    storage_account_name  = "terastorage78956"
    container_name        = "tfstate"
    key                   = "terraform.tfstate"
  }
  
  # Declare the Virtual Network
  resource "azurerm_virtual_network" "r-vnet" {
    name                = "kube-vnet"
    location            = azurerm_resource_group.r-grp.location
    resource_group_name = azurerm_resource_group.r-grp.name
    address_space       = ["10.0.0.0/16"]
  }
  # Declare the Subnet
  resource "azurerm_subnet" "internal" {
    name                 = "kube-subnet"
    resource_group_name  = azurerm_resource_group.r-grp.name
    virtual_network_name = azurerm_virtual_network.r-vnet.name
    address_prefixes     = ["10.0.1.0/24"]
  }
  
  # Declare the Kubernetes Cluster
  resource "azurerm_kubernetes_cluster" "aks-cluster" {
    name                = "kubeaks-cluster"
    location            = azurerm_resource_group.r-grp.location
    resource_group_name = azurerm_resource_group.r-grp.name
    dns_prefix          = "aksdns"
    default_node_pool {
      name       = "default"
      node_count = 1
      vm_size    = "Standard_DS2_v2"
    }
    identity {
      type = "SystemAssigned"
    }
  }
