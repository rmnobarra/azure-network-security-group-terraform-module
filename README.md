![Terraform Module Test](https://github.com/rmnobarra/azure-network-security-group-terraform-module/actions/workflows/workflow.yaml/badge.svg)

# Terraform Azure Network security group Module

This Terraform module creates an Azure network security group.

## Usage

```hcl
module "network_security_group" {
  source    = "git::https://github.com/rmnobarra/azure-network-security-group-terraform-module.git?ref=v1.0.0"
  nsg_name            = "nsg_well"
  location            = module.resource_group.rg_location
  resource_group_name = module.resource_group.rg_name
  subnet_id           = module.network.subnet_ids["subnet_a"]

  security_rules = [
    {
      name                       = "SSH"
      priority                   = 1001
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefixes    = ["138.94.194.127"]
      destination_address_prefix = "*"
    },
    {
      name                       = "HTTP"
      priority                   = 1002
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefixes      = ["*"]
      destination_address_prefix = "*"
    },
    {
      name                       = "HTTPS"
      priority                   = 1003
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "443"
      source_address_prefixes     = ["*"]
      destination_address_prefix = "*"
    }
  ]
}
```


Theres a fullexample in `/examples` folder.