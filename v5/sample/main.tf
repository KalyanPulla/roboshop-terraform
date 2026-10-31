resource "azurerm_network_interface" "main" {
  name                = "frontend-nic"
  location            = "Denmark East"
  resource_group_name = "denmark-east-rg-1"

  ip_configuration {
    name                          = "frontend-nic"
    subnet_id                     = "/subscriptions/396632f7-adca-488d-bb48-22d93391890f/resourceGroups/denmark-east-rg/providers/Microsoft.Network/virtualNetworks/vnet-denmarkeast-1/subnets/snet-denmarkeast-1"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.frontend.id
  }
}

resource "azurerm_linux_virtual_machine" "main" {
  name                  = "frontend-vm"
  location              = "Denmark East"
  resource_group_name   = "denmark-east-rg-1"
  network_interface_ids = [azurerm_network_interface.frontend.id]
  size                  = "Standard_B1s"

  source_image_id = "/subscriptions/396632f7-adca-488d-bb48-22d93391890f/resourceGroups/denmark-east-rg/providers/Microsoft.Compute/galleries/rhel10/images/1.0.0/versions/1.0.0"

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  admin_username = "devops"
  admin_password = "devops@12345"

  disable_password_authentication = false

  secure_boot_enabled = true
  vtpm_enabled        = true
}

resource "azurerm_dns_a_record" "main" {
  name                = "frontend-dev"
  zone_name           = "kaldevops14.online"
  resource_group_name = "denmark-east-rg"
  ttl                 = 30
  records             = [azurerm_network_interface.frontend.private_ip_address]
}