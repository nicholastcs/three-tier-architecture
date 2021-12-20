output "info" {
  value = {
    subnets = {
      for key, r in merge(aws_subnet.public, aws_subnet.private) : key => {
        subnet_id  = r.id
        cidr_range = r.cidr_block
      }
    }

    security_groups = {
      for r in concat([
        aws_security_group.pub_instance,
        aws_security_group.web_instance,
        aws_security_group.app_instance
        ], values(aws_security_group.db_instance)) : r.tags.Name => {
        security_group_id = r.id
      }
    }
  }
}