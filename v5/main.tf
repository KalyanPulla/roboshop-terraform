module "db" {
  for_each = var.db
  source = "./sample"
  component_name = each.key
  rgname = var.rgname
  image_id = var.image_id
  subnet_id = var.subnet_id
  size = each.value
}

module "apps" {
  depends_on = [ module.db ]
  for_each = var.apps
  source = "./sample"
  component_name = each.key
  rgname = var.rgname
  image_id = var.image_id
  subnet_id = var.subnet_id
  size = each.value
}

module "ui" {
  depends_on = [ module.apps ]
  for_each = var.ui
  source = "./sample"
  component_name = each.key
  rgname = var.rgname
  image_id = var.image_id
  subnet_id = var.subnet_id
  size = each.value
}