module "common" {
  source = "../../common/"

  cost_centre = "Tutorial-Business-Unit"
  environment = "dev"
}

module "this" {
  source = "../../modules/vpc/"

  name           = module.common.name
  environment    = module.common.environment
  vpc_cidr_block = "172.16.0.0/21"
  region         = "ap-southeast-1"

  public_subnets_configuration = local.public_subnets_configuration
  private_subnets_configuration = concat(
    local.private_app_subnets_configuration,
    local.private_web_subnets_configuration,
    local.private_db_subnets_configuration
  )
}

output "info" {
  value = module.this.info
}