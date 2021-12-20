resource "random_password" "this" {
  length  = 16
  special = false
}

resource "aws_ssm_parameter" "password" {
  name      = lower("/${var.name}/${var.environment}/aurora-psql/password")
  type      = "SecureString"
  value     = random_password.this.result
  overwrite = true

  tags = {
    Name = "${local.name_env}-aurora-psql-ssm-password"
  }
}

resource "random_id" "snap" {
  byte_length = 4
}
