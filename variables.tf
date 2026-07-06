variable "admin_username" {
description = "admin username"
type = string
default = "azureuser"  
}

variable "public_key" {
description = "mypublickey"
type = string
default = "mnt/workspace/id_rsa.pub"
}

variable "public_ip_address" {
description = "mypublicipaddress"
type = string
default = "terraformpublicip"
}

variable "instance" {
  description = "my instance configurations"
  type = map(object({
    vm_size = string
  }))
  default = {
    "vm1" = { vm_size = "Standard_B1s" } # 🌟 Changed to 1 core
    "vm2" = { vm_size = "Standard_B1s" } # 🌟 Changed to 1 core
    "vm3" = { vm_size = "Standard_B1s" } # 🌟 Changed to 1 core
  }
}
  

variable "resource_group_name" {
description = "myrg"
type = string
default = "Resourcegroup2"
}

variable "vnet" {
description = "myvnet"
type = string
default = "vnet1"
}

variable "subnet" {
description = "mysubnet"
type = string
default = "subnet1"
}

variable "networkinterface" {
description = "mynetworkinterface"
type = string
default = "networkinterface1"
}

variable "nsg" {
description = "mynsg"
type = string
default = "nsg1"  
}

variable "ip_configuration" {
description = "myipconfig"
type = string
default = "myipconfig1"
}

variable "location" {
description = "location"
type = string
default = "EastUS"
}
