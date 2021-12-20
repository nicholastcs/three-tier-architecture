resource "aws_security_group" "pub_instance" {
  name        = "${local.name_env}-pub-sg"
  description = "${local.name_env} security group for public subnet"

  vpc_id = aws_vpc.this.id

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "Bastion host inside public subnet can reach public IP."
  }

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "Bastion host inside can be accessed by public IP only with key-pairs."
  }

  tags = {
    Name = "${local.name_env}-pub-sg"
  }
}

resource "aws_security_group" "web_instance" {
  name        = "${local.name_env}-web-sg"
  description = "${local.name_env} security group for web-tier"

  vpc_id = aws_vpc.this.id

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.pub_instance.id]
    description     = "Host can be accessed by bastion inside public subnet only with key-pairs."
  }

  tags = {
    Name = "${local.name_env}-web-sg"
  }
}

resource "aws_security_group" "app_instance" {
  name        = "${local.name_env}-app-sg"
  description = "${local.name_env} security group for app-tier."

  vpc_id = aws_vpc.this.id

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.web_instance.id]
    description     = "Application inside app-tier subnet can receive request from instances in web-tier subnet."
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    self        = true
    description = "Application inside app-tier subnet able to communicate with each other."
  }

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.pub_instance.id]
    description     = "Host can be accessed by bastion hosts inside public subnet only with key-pairs."
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "Application inside app-tier subnet can reach public IP."
  }

  tags = {
    Name = "${local.name_env}-app-sg"
  }
}

resource "aws_security_group" "db_instance" {
  for_each = local.db_ports_by_vendor

  name        = "${local.name_env}-${each.key}-db-sg"
  description = "${local.name_env} security group for db-tier for ${each.key}."

  vpc_id = aws_vpc.this.id

  ingress {
    from_port       = each.value
    to_port         = each.value
    protocol        = "tcp"
    security_groups = [aws_security_group.app_instance.id]
    description     = "Databases inside db-tier subnet can receive request from instances in app-tier subnet."
  }

  tags = {
    Name = "${local.name_env}-${each.key}-db-sg"
  }
}