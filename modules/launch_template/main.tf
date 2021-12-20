resource "aws_launch_configuration" "this" {
  name          = "${local.name_env}-${var.tier}-launch-tmpl"
  image_id      = var.ami
  instance_type = var.instance_type
  key_name      = aws_key_pair.generated_key.id

  security_groups             = [data.aws_security_group.selected.id]
  associate_public_ip_address = false

  iam_instance_profile = data.aws_iam_instance_profile.selected.name
}