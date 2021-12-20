resource "aws_lb_target_group" "this" {
  name_prefix = substr(local.name_env, 0, 6)
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = data.aws_vpc.selected.id

  health_check {
    interval = 10
    port     = 80
    protocol = "HTTP"
    path     = var.health_check_path
    matcher  = 200
  }

  slow_start           = 0
  deregistration_delay = 10

  tags = {
    Name = "${local.name_env}-${var.app_name}-tg"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lb_listener_rule" "this" {
  listener_arn = data.aws_lb_listener.http.arn

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }

  condition {
    path_pattern {
      values = var.paths
    }
  }

  tags = {
    Name = "${local.name_env}-${var.app_name}-listener-rule"
  }

  lifecycle {
    create_before_destroy = true
  }
}
