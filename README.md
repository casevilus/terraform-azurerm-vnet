# terraform-azure-vnet
Terraform module to create an Azure Virtual Network and one or more Subnets.

# Usage
```terraform

module "vnet" {
  source          = "app.terraform.io/CADENCE_TEST/terraform-azure-vnet"
  version         = "0.0.1"

  name                = "my-vnet"
  resource_group_name = var.resource_group_name
  location            = "West Europe"
  tags                = var.tags

  address_space = "10.154.0.0/16"
  subnets = [
    {
      name     = "aks"
      number   = 1
      services = ["Microsoft.Storage","Microsoft.Sql","Microsoft.Web",
        "Microsoft.ServiceBus","Microsoft.KeyVault","Microsoft.AzureCosmosDB",
        "Microsoft.ContainerRegistry","Microsoft.EventHub","Microsoft.AzureActiveDirectory","Microsoft.CognitiveServices"
      ]
    },
    {
      name     = "aura"
      number   = 2
      services = []
    },
    {
      name     = "ep"
      number   = 3
      services = []
    }
  ]
}

```
