resource "aws_lb" "internal" {
  name               = "${local.name_env}-private-lb"
  internal           = true
  load_balancer_type = "application"
  subnets            = data.aws_subnets.private_app_selected.ids

  security_groups = [data.aws_security_group.app_instance.id]

  enable_deletion_protection = false

  tags = {
    Name     = "${local.name_env}-private-lb"
    Internal = true
  }
}

resource "aws_lb_listener" "internal_http" {
  load_balancer_arn = aws_lb.internal.arn

  port     = 80
  protocol = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Not found, no instances bound to the internal ALB."
      status_code  = 404
    }
  }
}

# internal alb target group and listener rule managed externally for path based routing to app-instances