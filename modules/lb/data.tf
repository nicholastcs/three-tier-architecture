data "aws_acm_certificate" "this" {
  count    = var.enforce_tls ? 1 : 0
  domain   = var.certificate_domain
  statuses = ["ISSUED"]
}

data "aws_vpc" "selected" {
  tags = {
    "Project Name" = var.name
    "Environment"  = var.environment
  }
}

data "aws_subnets" "selected" {
  tags = {
    "Project Name" = var.name
    "Environment"  = var.environment
    "Type"         = "public"
  }
}

data "aws_subnets" "private_app_selected" {
  tags = {
    "Project Name" = var.name
    "Environment"  = var.environment
    "Type"         = "app"
  }
}

data "aws_security_group" "app_instance" {
  tags = {
    "Project Name" = var.name
    "Environment"  = var.environment
    "Name"         = "${var.name}-${var.environment}-app-sg"
  }
}