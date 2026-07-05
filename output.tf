output "extracted_ip" {
  description = "The public IP addresses of the deployed virtual machines"
  
  # 🌟 FIXED: Loops through the map and pairs each VM name with its IP address
  value = { for name, pip in azurerm_public_ip.mypublicip : name => pip.ip_address }
}
