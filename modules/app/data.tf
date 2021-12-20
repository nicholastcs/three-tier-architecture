data "aws_vpc" "selected" {
  tags = {
    "Project Name" = var.name
    "Environment"  = var.environment
  }
}

data "aws_lb" "this" {
  name = "${var.name}-${var.environment}-private-lb"
}

data "aws_lb_listener" "http" {
  load_balancer_arn = data.aws_lb.this.arn
  port              = 80
}