resource "aws_lb" "public" {
  name               = "${local.name_env}-lb"
  internal           = false
  load_balancer_type = "network"
  subnets            = data.aws_subnets.selected.ids

  enable_deletion_protection = false

  tags = {
    Name     = "${local.name_env}-lb"
    Internal = false
  }
}

resource "aws_lb_target_group" "tcp" {
  name     = "${local.name_env}-tg-tcp"
  port     = 80
  protocol = "TCP"
  vpc_id   = data.aws_vpc.selected.id

  health_check {
    interval = 10
    port     = 80
    protocol = "TCP"
  }

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "${local.name_env}-tg-tcp"
  }
}

# if you have a certificate...
resource "aws_lb_listener" "tls" {
  count = var.enforce_tls ? 1 : 0

  load_balancer_arn = aws_lb.public.arn

  port            = 443
  protocol        = "TLS"
  certificate_arn = data.aws_acm_certificate.this[0].arn
  ssl_policy      = "ELBSecurityPolicy-2016-08"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tcp.arn
  }

  tags = {
    Name = "${local.name_env}-external-lb-tls-listener"
  }
}

# if you don't have certificate...
resource "aws_lb_listener" "tcp" {
  load_balancer_arn = aws_lb.public.arn

  port     = 80
  protocol = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tcp.arn
  }

  tags = {
    Name = "${local.name_env}-external-lb-tcp-listener"
  }
}
