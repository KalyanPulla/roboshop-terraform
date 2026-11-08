variable "location" {
  default = "Denmark East"
}

variable "rgname" {
  default = "denmark-east-rg"
}

variable "image_id" {
  default = "/subscriptions/396632f7-adca-488d-bb48-22d93391890f/resourceGroups/denmark-east-rg/providers/Microsoft.Compute/galleries/rhel10/images/1.0.0/versions/1.0.0"
}

variable "subnet_id" {
  default = "/subscriptions/396632f7-adca-488d-bb48-22d93391890f/resourceGroups/denmark-east-rg/providers/Microsoft.Network/virtualNetworks/vnet-denmarkeast-1/subnets/snet-denmarkeast-1"
}

variable "db" {
  default = {
    mysql = "Standard_B1s"
    mongodb = "Standard_B1s"
    valkey = "Standard_B1s"
    rabbitmq = "Standard_B1s"
  }
}

variable "apps" {
  default = {
    catalogue = "Standard_B1s"
    user = "Standard_B1s"
    cart = "Standard_B1s"
    shipping = "Standard_B2ts_v2"
    payment = "Standard_B2ts_v2"
    notification = "Standard_B2ts_v2"
    orders = "Standard_B2ts_v2"
    ratings = "Standard_B2ts_v2"
  }
}

variable "ui" {
  default = {
    frontend = "Standard_B1s"
  }
}