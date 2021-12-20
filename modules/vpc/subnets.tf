resource "aws_subnet" "public" {
  for_each = local.public_subnet_config_by_name

  vpc_id                  = aws_vpc.this.id
  availability_zone       = each.value.availability_zone
  cidr_block              = each.value.cidr_block
  map_public_ip_on_launch = true

  tags = {
    "Name"              = each.key
    "Availability Zone" = each.value.availability_zone
    "Type"              = "public"
  }
}

resource "aws_subnet" "private" {
  for_each = local.private_subnet_config_by_name

  vpc_id                  = aws_vpc.this.id
  availability_zone       = each.value.availability_zone
  cidr_block              = each.value.cidr_block
  map_public_ip_on_launch = false

  tags = {
    "Name"              = each.key
    "Availability Zone" = each.value.availability_zone
    "Type"              = each.value.type
  }
}