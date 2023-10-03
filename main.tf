resource "azurerm_virtual_network" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = [var.address_space]
  tags                = var.tags
 dynamic "ddos_protection_plan" {
    for_each = var.create_ddos_plan ? [{}] : []

    content {
      id     = var.ddos_protection_plan_id
      enable = true
    }
  }

}

resource "azurerm_subnet" "this" {
  for_each = {
    for s in var.subnets : s.name => {
      name   = s.name
      cidr = s.cidr
      services = s.services
    }
  }

  name                 = each.value.name
  address_prefixes     = [each.value.cidr]
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.this.name
  service_endpoints    = length(each.value.services) != 0 ? each.value.services : null

}
