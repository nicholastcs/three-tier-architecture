resource "aws_autoscaling_group" "this" {
  name = "${aws_launch_configuration.this.name}-${var.tier}-asg"

  min_size         = 1
  desired_capacity = 3
  max_size         = 5

  # nothing inside the vm, for sake of testing, will use EC2 health check type.
  health_check_type = "EC2"

  target_group_arns = var.external_target_group_arn == "" ? [data.aws_lb_target_group.selected.arn] : [var.external_target_group_arn]

  launch_configuration = aws_launch_configuration.this.name

  enabled_metrics = [
    "GroupMinSize",
    "GroupMaxSize",
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupTotalInstances"
  ]

  metrics_granularity = "1Minute"

  vpc_zone_identifier = data.aws_subnets.selected.ids

  # Required to redeploy without an outage.
  lifecycle {
    create_before_destroy = true
  }

  tag {
    key                 = "Name"
    value               = "${aws_launch_configuration.this.name}-${var.tier}-instance"
    propagate_at_launch = true
  }
}