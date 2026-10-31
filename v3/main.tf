resource "azurerm_resource_group" "denmark-east-rg" {
  name = var.resource_group[1]
  location = var.location
}

resource "azurerm_network_interface" "main" {
  for_each = var.components
  name = "${each.key}-nic"
  location = var.location
  resource_group_name = var.resource_group[1]

  ip_configuration {
    name = "${each.key}-nic"
    subnet_id = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "frontend" {
  for_each = var.components
  name = "${each.key}-vm"
  location = var.location
  resource_group_name = var.resource_group[1]
  network_interface_ids = [azurerm_network_interface.main[each.key].id]
  size = "${each.value}"

  source_image_id = var.image_id
  os_disk {
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  admin_username = "devops"
  admin_password = "devops@12345"
  disable_password_authentication = false
  secure_boot_enabled = true
  vtpm_enabled = true
}

resource "azurerm_dns_a_record" "frontend" {
  for_each = var.components
  name = "${each.key}-dev"
  zone_name = "kaldevops14.online"
  resource_group_name = var.resource_group[0]
  ttl = 30
  records = [azurerm_network_interface.main[each.key].private_ip_address]
}