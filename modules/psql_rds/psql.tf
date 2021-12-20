resource "aws_rds_cluster_instance" "this" {
  count = var.instance_count

  identifier                 = "${local.name_env}-${count.index}-aurora-psql"
  cluster_identifier         = aws_rds_cluster.this.id
  publicly_accessible        = false
  engine                     = "aurora-postgresql"
  auto_minor_version_upgrade = false
  apply_immediately          = true
  instance_class             = var.instance_class

  tags = {
    Name = "${local.name_env}-${count.index}-aurora-psql"
  }
}

resource "aws_rds_cluster" "this" {
  cluster_identifier        = "${local.name_env}-aurora-psql-cluster"
  engine_version            = var.engine_version
  engine                    = "aurora-postgresql"
  availability_zones        = var.availability_zones
  database_name             = "postgres"
  master_username           = "root"
  master_password           = random_password.this.result
  db_subnet_group_name      = aws_db_subnet_group.this.name
  apply_immediately         = true
  deletion_protection       = false
  vpc_security_group_ids    = [data.aws_security_group.db_instance.id]
  skip_final_snapshot       = true
  final_snapshot_identifier = "${local.name_env}-aurora-psql-cluster-${random_id.snap.hex}"

  tags = {
    Name = "${local.name_env}-aurora-psql-cluster"
  }
}

resource "aws_db_subnet_group" "this" {
  name       = "${local.name_env}-db-subnet-group"
  subnet_ids = data.aws_subnets.selected.ids

  tags = {
    Name = "${local.name_env}-db-subnet-group"
  }
}