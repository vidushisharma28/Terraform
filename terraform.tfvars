variable "admin_username" {
  description = "value of adminusername"
  type = string
  default = "azureuser"

}


variable "public_key" {
description = "mypublickey"
type = string
default = "mnt/workspace/id_rsa.pub"
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


variable "location" {
description = "location"
type = string
default = "EastUS"
}

variable "vnet" {
  description = "my vnet"
  type = string

}

variable "subnet" {
  description = "my subnet"
  type = string

}

variable "nsg" {
  description = "my nsg"
  type = string
  
}

variable "networkinterface" {
  description = "my NIC"
  type = string

}


variable "public_ip_address" {
  description = "my publicipaddress"
  type = string

}

variable "ip_configuration" {
  description = "my ip configuration"
  type = string
}


