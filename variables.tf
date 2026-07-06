variable "admin_username" {
description = "admin username"
type = string
default = "azureuser"  
} 

variable "public_key" {
description = "mypublickey"
type = string
default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCjdwbIARXNx+ximkRW1kCGNMNRMDuIuZTF7vgcf8eNwrJaX7RQCwMyBgfTVUvU/mXJsJEDJtX/BqfmDMJ5b8DpA0zoPF/Rd5spqq4Tc7jM/DUL3TpqptsHcKhIGhLnK/ZDpOJl9R7brWjBnfixR9oF9RWZ0DallDcM/chmfwG6bgscRkBr8GdUxDAU5SUW8EwSKPC7Fc4hfbAC2ulZmBQRVkHBonFWeqtPv8I6uPBRxbkn1ga8tvxtmVDt2JNBgHTu1LKvuN0tv77R8Lh2/UNCbHspK/YMRn8+hA1kGQ5ypK01Z09kruea9GQ1HG+16rx8UEo3/Glq6sBSa1Lo0jhnHv0hhCqnWuWc13OXgdXBA4bgyBuNr8QW8JszsdDTh//2+t8DZOu+yg2rP1TWsjO9IQ0tuiQNdNKd/Ik4TEbHp5CQUfTW4I5V7FCc2eEAnhA2NeGNu8ah6owMhiMKpUTe9zG3WKxnVH1lVo2jw1Mgyop73DxY5RYt6KvX1WLnewhEW8+TiVkyMG1ihbAFLxoDEnApV9FgAxzJLuaeQY0umLy63doq91/qq6F6a0bQFcFUz8knMc8racD+aGvKLSG4dabxQuvOQi6tvqz1oUlyEaYBGZeafW31jlUapKKfjhUES8L60HEEt1t/cjB8Bq0GRghceiw5IbmvcxqLh4aNVQ== vidushi_sharma@DESKTOP-LCA5EUL"
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

