locals {
  name_env = "${var.name}-${var.environment}"

  private_subnet_config_by_name = {
    for c in var.private_subnets_configuration : "${local.name_env}-private-${c.type}-${c.zone}" => merge(c, {
      availability_zone = "${var.region}${c.zone}"
    })
  }

  public_subnet_config_by_name = {
    for c in var.public_subnets_configuration : "${local.name_env}-public-${c.zone}" => merge(c, {
      availability_zone = "${var.region}${c.zone}"
    })
  }

  public_subnet_config_by_name_with_nats = {
    for key, c in local.public_subnet_config_by_name : key => c if c.attach_nat_gateway == true
  }

  db_ports_by_vendor = {
    "mysql" = 3306
    "psql"  = 5432
    "redis" = 6379
  }
}