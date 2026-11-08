module "db" {
  for_each       = var.db
  source         = "./modules/vm"
  component_name = each.key
  rgname         = var.rgname
  image_id       = var.image_id
  subnet_id      = var.subnet_id
  size           = each.value
  env            = var.env
}

module "apps" {
  depends_on     = [module.db]
  for_each       = var.apps
  source         = "./modules/vm"
  component_name = each.key
  rgname         = var.rgname
  image_id       = var.image_id
  subnet_id      = var.subnet_id
  size           = each.value
  env            = var.env
}

module "ui" {
  depends_on     = [module.apps]
  for_each       = var.ui
  source         = "./modules/vm"
  component_name = each.key
  rgname         = var.rgname
  image_id       = var.image_id
  subnet_id      = var.subnet_id
  size           = each.value
  env            = var.env
}