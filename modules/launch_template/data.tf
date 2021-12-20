data "aws_security_group" "selected" {
  tags = {
    "Project Name" = var.name
    "Environment"  = var.environment
    "Name"         = "${var.name}-${var.environment}-${var.tier}-sg"
  }
}

data "aws_lb_target_group" "selected" {
  name = "${var.name}-${var.environment}-tg-tcp"
  tags = {
    "Project Name" = var.name
    "Environment"  = var.environment
    "Name"         = "${var.name}-${var.environment}-tg-tcp"
  }
}

data "aws_subnets" "selected" {
  tags = {
    "Project Name" = var.name
    "Environment"  = var.environment
    "Type"         = var.tier
  }
}

data "aws_iam_instance_profile" "selected" {
  name = "${local.name_env}-ec2-profile"
}
