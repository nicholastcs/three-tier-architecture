locals {
  public_subnets_configuration = [
    {
      attach_nat_gateway = true
      zone               = "a"
      cidr_block         = "172.16.0.0/27"
    },
    {
      attach_nat_gateway = true
      zone               = "b"
      cidr_block         = "172.16.0.32/27"
    },
    {
      attach_nat_gateway = true
      zone               = "c"
      cidr_block         = "172.16.0.64/27"
    }
  ]

  private_db_subnets_configuration = [
    {
      cidr_block   = "172.16.1.96/27"
      route_to_nat = false
      zone         = "a"
      type         = "db"
    },
    {
      cidr_block   = "172.16.1.128/27"
      route_to_nat = false
      zone         = "b"
      type         = "db"
    },
    {
      cidr_block   = "172.16.1.160/27"
      route_to_nat = false
      zone         = "c"
      type         = "db"
    }
  ]

  private_web_subnets_configuration = [
    {
      cidr_block   = "172.16.0.128/26"
      route_to_nat = false
      zone         = "a"
      type         = "web"
    },
    {
      cidr_block   = "172.16.0.192/26"
      route_to_nat = false
      zone         = "b"
      type         = "web"
    },
    {
      cidr_block   = "172.16.1.0/26"
      route_to_nat = false
      zone         = "c"
      type         = "web"
    }
  ]

  private_app_subnets_configuration = [
    {
      cidr_block   = "172.16.2.0/24"
      route_to_nat = true
      zone         = "a"
      type         = "app"
    },
    {
      cidr_block   = "172.16.3.0/24"
      route_to_nat = true
      zone         = "b"
      type         = "app"
    },
    {
      cidr_block   = "172.16.4.0/24"
      route_to_nat = true
      zone         = "c"
      type         = "app"
    }
  ]
}