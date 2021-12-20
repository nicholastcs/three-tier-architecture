# private

resource "aws_route_table" "private_subnets" {
  for_each = local.private_subnet_config_by_name

  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${each.key}-route-table"
  }
}

resource "aws_route" "private" {
  for_each = {
    for key, c in local.private_subnet_config_by_name : key => c if c.route_to_nat == true
  }

  route_table_id         = aws_route_table.private_subnets[each.key].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nats["${var.name}-${var.environment}-public-${each.value.zone}"].id
}

resource "aws_route_table_association" "private_subnets" {
  for_each = local.private_subnet_config_by_name

  subnet_id      = aws_subnet.private[each.key].id
  route_table_id = aws_route_table.private_subnets[each.key].id
}

# public 

resource "aws_route_table" "public_subnets" {
  for_each = local.public_subnet_config_by_name

  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${each.key}-route-table"
  }
}

resource "aws_route" "public" {
  for_each = local.public_subnet_config_by_name

  route_table_id         = aws_route_table.public_subnets[each.key].id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public_subnets" {
  for_each = local.public_subnet_config_by_name

  subnet_id      = aws_subnet.public[each.key].id
  route_table_id = aws_route_table.public_subnets[each.key].id
}