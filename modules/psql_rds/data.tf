data "aws_subnets" "selected" {
  tags = {
    "Project Name" = var.name
    "Environment"  = var.environment
    "Type"         = "db"
  }
}

data "aws_security_group" "db_instance" {
  tags = {
    "Project Name" = var.name
    "Environment"  = var.environment
    "Name"         = "${var.name}-${var.environment}-psql-db-sg"
  }
}

data "aws_route53_zone" "selected" {
  name         = "${local.name_env}.internal"
  private_zone = true
}