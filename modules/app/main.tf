module "this" {
  source = "../../modules/launch_template/"

  name        = var.name
  environment = var.environment

  tier                      = var.tier
  instance_type             = var.instance_type
  ami                       = var.ami
  external_target_group_arn = aws_lb_target_group.this.arn
}