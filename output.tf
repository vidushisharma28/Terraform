output "vm_public_ip" {
  description = "The public IP address assigned to the virtual machine"
  value       = azurerm_public_ip.mypublicip.ip_address
}
