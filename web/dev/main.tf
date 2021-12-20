module "common" {
  source = "../../common/"

  cost_centre = "Tutorial-Business-Unit"
  environment = "dev"
}

module "this" {
  source = "../../modules/launch_template/"

  name        = module.common.name
  environment = module.common.environment

  tier = "web"
}