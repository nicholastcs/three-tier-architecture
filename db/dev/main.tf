module "common" {
  source = "../../common/"

  cost_centre = "Tutorial-Business-Unit"
  environment = "dev"
}

module "this" {
  source = "../../modules/psql_rds/"

  name               = module.common.name
  environment        = module.common.environment
  availability_zones = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
  instance_count     = 2
}