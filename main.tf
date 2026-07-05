  resource "azurerm_virtual_network" "vnet" {
    for_each = var.instance
    name                = "${var.vnet}-${each.key}"
    address_space       = ["10.0.0.0/16"]
    resource_group_name = var.resource_group_name
    location            = var.location
  }

  resource "azurerm_subnet" "subnet" {
    for_each = var.instance
    name                = "${var.subnet}-${each.key}"
    resource_group_name = var.resource_group_name
    virtual_network_name = azurerm_virtual_network.vnet[each.key].name
    address_prefixes     = ["10.0.2.0/24"]
  }

  resource "azurerm_network_security_group" "nsg" {
  for_each = var.instance
  name                = "${var.nsg}-${each.key}"
  location            = var.location
  resource_group_name = var.resource_group_name

  /*security_rule {
    name                       = "allow-http"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }*/
    security_rule {
    name                       = "allow-ssh"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  /*security_rule {
  name                       = "allow-flask"
  priority                   = 120
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "Tcp"
  source_port_range          = "*"
  destination_port_range     = "5000"
  source_address_prefix      = "*"
  destination_address_prefix = "*"
}*/
  }
  

  resource "azurerm_public_ip" "mypublicip" {
      for_each = var.instance
      name                = "${var.public_ip_address}-${each.key}"
      resource_group_name = var.resource_group_name
      location            = var.location
      allocation_method   = "Static"
      sku = "Standard"
  }

  resource "azurerm_network_interface" "networkinterface" {
    for_each = var.instance
    name                = "${var.networkinterface}-${each.key}"
    resource_group_name = var.resource_group_name
    location            = var.location

    ip_configuration {
      for_each = var.instance
      name                = "${var.ip_configuration}-${each.key}"
      subnet_id                     = azurerm_subnet.subnet[each.key].id
      private_ip_address_allocation = "Dynamic"
      public_ip_address_id = azurerm_public_ip.mypublicip.id
    }
  }

  resource "azurerm_network_interface_security_group_association" "nic_nsg" {
  network_interface_id      = azurerm_network_interface.networkinterface[each.key].id
  network_security_group_id = azurerm_network_security_group.nsg[each.key].id
}

  resource "azurerm_linux_virtual_machine" "virtualmachine" {
    for_each = var.instance # Loops over vm1, vm2, vm3
    name        = each.key
    size        = each.value.vm_size
    resource_group_name = var.resource_group_name
    location            = var.location
    admin_username = var.admin_username

    admin_ssh_key {
      username   = var.admin_username
      public_key = file(var.public_key)
    }
    disable_password_authentication = true
    network_interface_ids = [
      azurerm_network_interface.networkinterface.id,
    ]

    os_disk {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }

    source_image_reference {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }

  }

  
/*
    connection {
      type = "ssh"
      user = var.admin_username
      private_key = file("~/.ssh/id_rsa")
      host = azurerm_public_ip.mypublicip.ip_address
    }

    provisioner "file" {
      source = "app.py"
      destination = "/home/${var.admin_username}/app.py"
    
    }

    provisioner "remote-exec" {
      inline = [ 
        "sudo apt update -y",
        "sudo apt install python3-pip -y",
        "cd /home/${var.admin_username}/app.py",
        "sudo pip3 install flask",
        "nohup python3 ~/var.var.admin_username/app.py"
       ]
    }
  }  */

