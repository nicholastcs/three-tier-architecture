module "common" {
  source = "../../common/"

  cost_centre = "Tutorial-Business-Unit"
  environment = "dev"
}

module "this" {
  source = "../../modules/lb/"

  name        = module.common.name
  environment = module.common.environment
  enforce_tls = false
}