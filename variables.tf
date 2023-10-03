variable "name" {
  type        = string
  description = "(Required) Name of the vnet to create"
}

variable "resource_group_name" {
  type        = string
  description = "(Required) Name of the resource group to be imported."
}

variable "location" {
  type        = string
  description = "(Required) The location where the resource group should be created. For a list of all Azure locations, please consult this link or run az account list-locations --output table."
}

variable "address_space" {
  type        = string
  description = "(Required) The address space that is used by the virtual network."
}

variable "subnets" {
  type = list(object({
    name   = string
    cidr   = string
    services = list(string)
  }))
  description = "(Required) The subnets to create in the vnet."
}

variable "tags" {
  type        = map(string)
  description = "(Required) A map of the tags to use on the resources that are deployed with this module."
}

variable "create_ddos_plan" {
  type    = bool
  description = "(Optional) Add vnet to Azure DDos Protection"
  default = false
}

variable "ddos_protection_plan_id"{
  type = string
  default = ""
}