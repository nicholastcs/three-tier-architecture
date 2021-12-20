resource "aws_nat_gateway" "nats" {
  for_each = local.public_subnet_config_by_name_with_nats

  allocation_id = aws_eip.nats[each.key].id
  subnet_id     = aws_subnet.public[each.key].id

  tags = {
    Name = "${each.key}-nat-gateway"
  }
}

resource "aws_eip" "nats" {
  for_each = local.public_subnet_config_by_name_with_nats

  vpc = true
}