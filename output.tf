output "extracted_ip" {
  value = azurerm_public_ip.mypublicip[each.key].ip_address
}
