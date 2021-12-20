resource "tls_private_key" "key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = "${local.name_env}-${var.tier}-key-pair"
  public_key = tls_private_key.key.public_key_openssh

  tags = {
    Name = "${local.name_env}-${var.tier}-key-pair"
  }
}

resource "aws_ssm_parameter" "pem" {
  name      = lower("/${var.name}/${var.environment}/launch-tmpl/${var.tier}/password")
  type      = "SecureString"
  value     = tls_private_key.key.private_key_pem
  overwrite = true

  tags = {
    Name = "${local.name_env}-launch-tmpl-${var.tier}-pk"
  }
}
