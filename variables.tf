variable "nsg_name" {
  description = "Name of the network security group."
  type        = string
}

variable "location" {
  description = "Azure location where the NSG will be created."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group."
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet to associate the NSG with."
  type        = string
}

#variable "security_rules" {
#  description = "List of security rules to be applied to the NSG."
#  type        = list(map(any))
#}

variable "security_rules" {
  description = "List of security rules to be applied to the NSG."
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefixes    = list(string)
    destination_address_prefix = string
  }))
}
