module "common" {
  source = "../../../common/"

  cost_centre = "Tutorial-Business-Unit"
  environment = "dev"
}

module "main" {
  source = "../../../modules/app/"

  name        = module.common.name
  environment = module.common.environment

  app_name          = "app_1"
  paths             = ["/app-1/*"]
  health_check_path = "/app-1/health"
  tier              = "app"
}