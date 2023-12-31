output "vnet_id" {
  description = "The id of the newly created vnet"
  value       = azurerm_virtual_network.this.id
}

output "vnet_name" {
  description = "The Name of the newly created vnet"
  value       = azurerm_virtual_network.this.name
}

output "vnet_location" {
  description = "The location of the newly created vnet"
  value       = azurerm_virtual_network.this.location
}

output "vnet_address_space" {
  description = "The address space of the newly created vnet"
  value       = azurerm_virtual_network.this.address_space
}

output "vnet_subnets" {
  description = "The subnets created inside the newly created vnet"
  value       = { for k, v in azurerm_subnet.this : k => v.id }
}
