output "vm_public_ip" {
  description = "The public IP address assigned to the virtual machine"
  # 1. Changed "public_ip_address" to the correct Azure attribute "ip_address"
  value       = azurerm_public_ip.mypublicip.ip_address 
}
