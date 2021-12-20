resource "aws_route53_zone" "private" {
  name = "${local.name_env}.internal"

  vpc {
    vpc_id = aws_vpc.this.id
  }

  tags = {
    Name = "${local.name_env}-r53-zone"
  }
}