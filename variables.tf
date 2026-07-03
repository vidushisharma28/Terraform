variable "admin_username" {
  description = "value of adminusername"
  type = string

}


variable "public_key" {
  type        = string
  description = "SSH public key for VM login"
 
}


variable "vm_name" {
  type        = string
  description = "Name of the VM"

}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"

  
}

variable "location" {
  type        = string
  description = "Azure region"

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

variable "vm_size" {
  description = "myvmsize"
  type = string
}


