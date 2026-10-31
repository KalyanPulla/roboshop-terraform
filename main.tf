resource "azurerm_public_ip" "frontend" {
  name                = "frontend"
  location            = "Denmark East"
  resource_group_name = "denmark-east-rg"
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "frontend" {
  name                = "frontend-nic"
  location            = "Denmark East"
  resource_group_name = "denmark-east-rg"

  ip_configuration {
    name                          = "frontend-nic"
    subnet_id                     = "/subscriptions/396632f7-adca-488d-bb48-22d93391890f/resourceGroups/denmark-east-rg/providers/Microsoft.Network/virtualNetworks/vnet-denmarkeast-1/subnets/snet-denmarkeast-1"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.frontend.id
  }
}

resource "azurerm_linux_virtual_machine" "frontend" {
  name                  = "frontend-vm"
  location              = "Denmark East"
  resource_group_name   = "denmark-east-rg"
  network_interface_ids = [azurerm_network_interface.frontend.id]
  size                  = "Standard_B1s"

  source_image_id = "/subscriptions/396632f7-adca-488d-bb48-22d93391890f/resourceGroups/denmark-east-rg/providers/Microsoft.Compute/galleries/rhel10/images/1.0.0/versions/1.0.0"

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  admin_password = "devops@12345"
  admin_username = "devops"

  disable_password_authentication = false

  secure_boot_enabled = true
  vtpm_enabled        = true

}
resource "azurerm_dns_a_record" "frontend" {
  name                = "frontend-dev"
  zone_name           = "kaldevops14.online"
  resource_group_name = "denmark-east-rg"
  ttl                 = 30
  records             = [azurerm_network_interface.frontend.private_ip_address]
}

#mysql
resource "azurerm_network_interface" "mysql" {
  name                = "mysql-nic"
  location            = "Denmark East"
  resource_group_name = "denmark-east-rg"

  ip_configuration {
    name                          = "mysql-nic"
    subnet_id                     = "/subscriptions/396632f7-adca-488d-bb48-22d93391890f/resourceGroups/denmark-east-rg/providers/Microsoft.Network/virtualNetworks/vnet-denmarkeast-1/subnets/snet-denmarkeast-1"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "mysql" {
  name                  = "mysql-vm"
  location              = "Denmark East"
  resource_group_name   = "denmark-east-rg"
  network_interface_ids = [azurerm_network_interface.mysql.id]
  size                  = "Standard_B1s"

  source_image_id = "/subscriptions/396632f7-adca-488d-bb48-22d93391890f/resourceGroups/denmark-east-rg/providers/Microsoft.Compute/galleries/rhel10/images/1.0.0/versions/1.0.0"

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  admin_password = "devops@12345"
  admin_username = "devops"

  disable_password_authentication = false

  secure_boot_enabled = true
  vtpm_enabled        = true

}
resource "azurerm_dns_a_record" "mysql" {
  name                = "mysql-dev"
  zone_name           = "kaldevops14.online"
  resource_group_name = "denmark-east-rg"
  ttl                 = 30
  records             = [azurerm_network_interface.mysql.private_ip_address]
}
# catalogue
resource "azurerm_network_interface" "catalogue" {
  name                = "catalogue-nic"
  location            = "Denmark East"
  resource_group_name = "denmark-east-rg"

  ip_configuration {
    name                          = "catalogue-nic"
    subnet_id                     = "/subscriptions/396632f7-adca-488d-bb48-22d93391890f/resourceGroups/denmark-east-rg/providers/Microsoft.Network/virtualNetworks/vnet-denmarkeast-1/subnets/snet-denmarkeast-1"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "catalogue" {
  name                  = "catalogue-vm"
  location              = "Denmark East"
  resource_group_name   = "denmark-east-rg"
  network_interface_ids = [azurerm_network_interface.catalogue.id]
  size                  = "Standard_B1s"

  source_image_id = "/subscriptions/396632f7-adca-488d-bb48-22d93391890f/resourceGroups/denmark-east-rg/providers/Microsoft.Compute/galleries/rhel10/images/1.0.0/versions/1.0.0"

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  admin_password = "devops@12345"
  admin_username = "devops"

  disable_password_authentication = false

  secure_boot_enabled = true
  vtpm_enabled        = true

}
resource "azurerm_dns_a_record" "catalogue" {
  name                = "catalogue-dev"
  zone_name           = "kaldevops14.online"
  resource_group_name = "denmark-east-rg"
  ttl                 = 30
  records             = [azurerm_network_interface.catalogue.private_ip_address]
}
# mongodb

resource "azurerm_network_interface" "mongodb" {
  name                = "mongodb-nic"
  location            = "Denmark East"
  resource_group_name = "denmark-east-rg"

  ip_configuration {
    name                          = "mongodb-nic"
    subnet_id                     = "/subscriptions/396632f7-adca-488d-bb48-22d93391890f/resourceGroups/denmark-east-rg/providers/Microsoft.Network/virtualNetworks/vnet-denmarkeast-1/subnets/snet-denmarkeast-1"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "mongodb" {
  name                  = "mongodb-vm"
  location              = "Denmark East"
  resource_group_name   = "denmark-east-rg"
  network_interface_ids = [azurerm_network_interface.mongodb.id]
  size                  = "Standard_B1s"

  source_image_id = "/subscriptions/396632f7-adca-488d-bb48-22d93391890f/resourceGroups/denmark-east-rg/providers/Microsoft.Compute/galleries/rhel10/images/1.0.0/versions/1.0.0"

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  admin_password = "devops@12345"
  admin_username = "devops"

  disable_password_authentication = false

  secure_boot_enabled = true
  vtpm_enabled        = true

}
resource "azurerm_dns_a_record" "mongodb" {
  name                = "mongodb-dev"
  zone_name           = "kaldevops14.online"
  resource_group_name = "denmark-east-rg"
  ttl                 = 30
  records             = [azurerm_network_interface.mongodb.private_ip_address]
}
# user

resource "azurerm_network_interface" "user" {
  name                = "user-nic"
  location            = "Denmark East"
  resource_group_name = "denmark-east-rg"

  ip_configuration {
    name                          = "user-nic"
    subnet_id                     = "/subscriptions/396632f7-adca-488d-bb48-22d93391890f/resourceGroups/denmark-east-rg/providers/Microsoft.Network/virtualNetworks/vnet-denmarkeast-1/subnets/snet-denmarkeast-1"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "user" {
  name                  = "user-vm"
  location              = "Denmark East"
  resource_group_name   = "denmark-east-rg"
  network_interface_ids = [azurerm_network_interface.user.id]
  size                  = "Standard_B1s"

  source_image_id = "/subscriptions/396632f7-adca-488d-bb48-22d93391890f/resourceGroups/denmark-east-rg/providers/Microsoft.Compute/galleries/rhel10/images/1.0.0/versions/1.0.0"

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  admin_password = "devops@12345"
  admin_username = "devops"

  disable_password_authentication = false

  secure_boot_enabled = true
  vtpm_enabled        = true

}
resource "azurerm_dns_a_record" "user" {
  name                = "user-dev"
  zone_name           = "kaldevops14.online"
  resource_group_name = "denmark-east-rg"
  ttl                 = 30
  records             = [azurerm_network_interface.user.private_ip_address]
}
# valkey
resource "azurerm_network_interface" "valkey" {
  name                = "valkey-nic"
  location            = "Denmark East"
  resource_group_name = "denmark-east-rg"

  ip_configuration {
    name                          = "valkey-nic"
    subnet_id                     = "/subscriptions/396632f7-adca-488d-bb48-22d93391890f/resourceGroups/denmark-east-rg/providers/Microsoft.Network/virtualNetworks/vnet-denmarkeast-1/subnets/snet-denmarkeast-1"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "valkey" {
  name                  = "valkey-vm"
  location              = "Denmark East"
  resource_group_name   = "denmark-east-rg"
  network_interface_ids = [azurerm_network_interface.valkey.id]
  size                  = "Standard_B1s"

  source_image_id = "/subscriptions/396632f7-adca-488d-bb48-22d93391890f/resourceGroups/denmark-east-rg/providers/Microsoft.Compute/galleries/rhel10/images/1.0.0/versions/1.0.0"

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  admin_password = "devops@12345"
  admin_username = "devops"

  disable_password_authentication = false

  secure_boot_enabled = true
  vtpm_enabled        = true

}
resource "azurerm_dns_a_record" "valkey" {
  name                = "valkey-dev"
  zone_name           = "kaldevops14.online"
  resource_group_name = "denmark-east-rg"
  ttl                 = 30
  records             = [azurerm_network_interface.valkey.private_ip_address]
}
# cart

resource "azurerm_network_interface" "cart" {
  name                = "cart-nic"
  location            = "Denmark East"
  resource_group_name = "denmark-east-rg"

  ip_configuration {
    name                          = "cart-nic"
    subnet_id                     = "/subscriptions/396632f7-adca-488d-bb48-22d93391890f/resourceGroups/denmark-east-rg/providers/Microsoft.Network/virtualNetworks/vnet-denmarkeast-1/subnets/snet-denmarkeast-1"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "cart" {
  name                  = "cart-vm"
  location              = "Denmark East"
  resource_group_name   = "denmark-east-rg"
  network_interface_ids = [azurerm_network_interface.cart.id]
  size                  = "Standard_B1s"

  source_image_id = "/subscriptions/396632f7-adca-488d-bb48-22d93391890f/resourceGroups/denmark-east-rg/providers/Microsoft.Compute/galleries/rhel10/images/1.0.0/versions/1.0.0"

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  admin_password = "devops@12345"
  admin_username = "devops"

  disable_password_authentication = false

  secure_boot_enabled = true
  vtpm_enabled        = true

}
resource "azurerm_dns_a_record" "cart" {
  name                = "cart-dev"
  zone_name           = "kaldevops14.online"
  resource_group_name = "denmark-east-rg"
  ttl                 = 30
  records             = [azurerm_network_interface.cart.private_ip_address]
}
# shipping
resource "azurerm_network_interface" "shipping" {
  name                = "shipping-nic"
  location            = "Denmark East"
  resource_group_name = "denmark-east-rg"

  ip_configuration {
    name                          = "shipping-nic"
    subnet_id                     = "/subscriptions/396632f7-adca-488d-bb48-22d93391890f/resourceGroups/denmark-east-rg/providers/Microsoft.Network/virtualNetworks/vnet-denmarkeast-1/subnets/snet-denmarkeast-1"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "shipping" {
  name                  = "shipping-vm"
  location              = "Denmark East"
  resource_group_name   = "denmark-east-rg"
  network_interface_ids = [azurerm_network_interface.shipping.id]
  size                  = "Standard_B1s"

  source_image_id = "/subscriptions/396632f7-adca-488d-bb48-22d93391890f/resourceGroups/denmark-east-rg/providers/Microsoft.Compute/galleries/rhel10/images/1.0.0/versions/1.0.0"

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  admin_password = "devops@12345"
  admin_username = "devops"

  disable_password_authentication = false

  secure_boot_enabled = true
  vtpm_enabled        = true

}
resource "azurerm_dns_a_record" "shipping" {
  name                = "shipping-dev"
  zone_name           = "kaldevops14.online"
  resource_group_name = "denmark-east-rg"
  ttl                 = 30
  records             = [azurerm_network_interface.shipping.private_ip_address]
}
# rabbitmq

resource "azurerm_network_interface" "rabbitmq" {
  name                = "rabbitmq-nic"
  location            = "Denmark East"
  resource_group_name = "denmark-east-rg"

  ip_configuration {
    name                          = "rabbitmq-nic"
    subnet_id                     = "/subscriptions/396632f7-adca-488d-bb48-22d93391890f/resourceGroups/denmark-east-rg/providers/Microsoft.Network/virtualNetworks/vnet-denmarkeast-1/subnets/snet-denmarkeast-1"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "rabbitmq" {
  name                  = "rabbitmq-vm"
  location              = "Denmark East"
  resource_group_name   = "denmark-east-rg"
  network_interface_ids = [azurerm_network_interface.rabbitmq.id]
  size                  = "Standard_B1s"

  source_image_id = "/subscriptions/396632f7-adca-488d-bb48-22d93391890f/resourceGroups/denmark-east-rg/providers/Microsoft.Compute/galleries/rhel10/images/1.0.0/versions/1.0.0"

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  admin_password = "devops@12345"
  admin_username = "devops"

  disable_password_authentication = false

  secure_boot_enabled = true
  vtpm_enabled        = true

}
resource "azurerm_dns_a_record" "rabbitmq" {
  name                = "rabbitmq-dev"
  zone_name           = "kaldevops14.online"
  resource_group_name = "denmark-east-rg"
  ttl                 = 30
  records             = [azurerm_network_interface.rabbitmq.private_ip_address]
}
# payment

resource "azurerm_network_interface" "payment" {
  name                = "payment-nic"
  location            = "Denmark East"
  resource_group_name = "denmark-east-rg"

  ip_configuration {
    name                          = "payment-nic"
    subnet_id                     = "/subscriptions/396632f7-adca-488d-bb48-22d93391890f/resourceGroups/denmark-east-rg/providers/Microsoft.Network/virtualNetworks/vnet-denmarkeast-1/subnets/snet-denmarkeast-1"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "payment" {
  name                  = "payment-vm"
  location              = "Denmark East"
  resource_group_name   = "denmark-east-rg"
  network_interface_ids = [azurerm_network_interface.payment.id]
  size                  = "Standard_B1s"

  source_image_id = "/subscriptions/396632f7-adca-488d-bb48-22d93391890f/resourceGroups/denmark-east-rg/providers/Microsoft.Compute/galleries/rhel10/images/1.0.0/versions/1.0.0"

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  admin_password = "devops@12345"
  admin_username = "devops"

  disable_password_authentication = false

  secure_boot_enabled = true
  vtpm_enabled        = true

}
resource "azurerm_dns_a_record" "payment" {
  name                = "payment-dev"
  zone_name           = "kaldevops14.online"
  resource_group_name = "denmark-east-rg"
  ttl                 = 30
  records             = [azurerm_network_interface.payment.private_ip_address]
}
# notification

resource "azurerm_network_interface" "notification" {
  name                = "notification-nic"
  location            = "Denmark East"
  resource_group_name = "denmark-east-rg"

  ip_configuration {
    name                          = "notification-nic"
    subnet_id                     = "/subscriptions/396632f7-adca-488d-bb48-22d93391890f/resourceGroups/denmark-east-rg/providers/Microsoft.Network/virtualNetworks/vnet-denmarkeast-1/subnets/snet-denmarkeast-1"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "notification" {
  name                  = "notification-vm"
  location              = "Denmark East"
  resource_group_name   = "denmark-east-rg"
  network_interface_ids = [azurerm_network_interface.notification.id]
  size                  = "Standard_B2ts_v2"

  source_image_id = "/subscriptions/396632f7-adca-488d-bb48-22d93391890f/resourceGroups/denmark-east-rg/providers/Microsoft.Compute/galleries/rhel10/images/1.0.0/versions/1.0.0"

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  admin_password = "devops@12345"
  admin_username = "devops"

  disable_password_authentication = false

  secure_boot_enabled = true
  vtpm_enabled        = true

}
resource "azurerm_dns_a_record" "notification" {
  name                = "notification-dev"
  zone_name           = "kaldevops14.online"
  resource_group_name = "denmark-east-rg"
  ttl                 = 30
  records             = [azurerm_network_interface.notification.private_ip_address]
}
# orders

resource "azurerm_network_interface" "orders" {
  name                = "orders-nic"
  location            = "Denmark East"
  resource_group_name = "denmark-east-rg"

  ip_configuration {
    name                          = "orders-nic"
    subnet_id                     = "/subscriptions/396632f7-adca-488d-bb48-22d93391890f/resourceGroups/denmark-east-rg/providers/Microsoft.Network/virtualNetworks/vnet-denmarkeast-1/subnets/snet-denmarkeast-1"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "orders" {
  name                  = "orders-vm"
  location              = "Denmark East"
  resource_group_name   = "denmark-east-rg"
  network_interface_ids = [azurerm_network_interface.orders.id]
  size                  = "Standard_B2ts_v2"

  source_image_id = "/subscriptions/396632f7-adca-488d-bb48-22d93391890f/resourceGroups/denmark-east-rg/providers/Microsoft.Compute/galleries/rhel10/images/1.0.0/versions/1.0.0"

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  admin_password = "devops@12345"
  admin_username = "devops"

  disable_password_authentication = false

  secure_boot_enabled = true
  vtpm_enabled        = true

}
resource "azurerm_dns_a_record" "orders" {
  name                = "orders-dev"
  zone_name           = "kaldevops14.online"
  resource_group_name = "denmark-east-rg"
  ttl                 = 30
  records             = [azurerm_network_interface.orders.private_ip_address]
}
# ratings

resource "azurerm_network_interface" "ratings" {
  name                = "ratings-nic"
  location            = "Denmark East"
  resource_group_name = "denmark-east-rg"

  ip_configuration {
    name                          = "ratings-nic"
    subnet_id                     = "/subscriptions/396632f7-adca-488d-bb48-22d93391890f/resourceGroups/denmark-east-rg/providers/Microsoft.Network/virtualNetworks/vnet-denmarkeast-1/subnets/snet-denmarkeast-1"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "ratings" {
  name                  = "ratings-vm"
  location              = "Denmark East"
  resource_group_name   = "denmark-east-rg"
  network_interface_ids = [azurerm_network_interface.ratings.id]
  size                  = "Standard_B2ts_v2"

  source_image_id = "/subscriptions/396632f7-adca-488d-bb48-22d93391890f/resourceGroups/denmark-east-rg/providers/Microsoft.Compute/galleries/rhel10/images/1.0.0/versions/1.0.0"

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  admin_password = "devops@12345"
  admin_username = "devops"

  disable_password_authentication = false

  secure_boot_enabled = true
  vtpm_enabled        = true

}
resource "azurerm_dns_a_record" "ratings" {
  name                = "ratings-dev"
  zone_name           = "kaldevops14.online"
  resource_group_name = "denmark-east-rg"
  ttl                 = 30
  records             = [azurerm_network_interface.ratings.private_ip_address]
}
provider "azurerm" {
  features {
    
  }
}