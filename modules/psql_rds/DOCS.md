<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.0.6 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 3.67.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.67.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.1.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_db_subnet_group.this](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/db_subnet_group) | resource |
| [aws_rds_cluster.this](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/rds_cluster) | resource |
| [aws_rds_cluster_instance.this](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/rds_cluster_instance) | resource |
| [aws_route53_record.this](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/route53_record) | resource |
| [aws_ssm_parameter.password](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/ssm_parameter) | resource |
| [random_id.snap](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [random_password.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [aws_route53_zone.selected](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/data-sources/route53_zone) | data source |
| [aws_security_group.db_instance](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/data-sources/security_group) | data source |
| [aws_subnets.selected](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/data-sources/subnets) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_availability_zones"></a> [availability\_zones](#input\_availability\_zones) | Database availability zones. | `list(string)` | n/a | yes |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | Aurora PostgreSQL engine version. | `string` | `"13.4"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | App environment. | `string` | n/a | yes |
| <a name="input_instance_class"></a> [instance\_class](#input\_instance\_class) | Database instance class. | `string` | `"db.t3.medium"` | no |
| <a name="input_instance_count"></a> [instance\_count](#input\_instance\_count) | Database instance count. | `number` | `1` | no |
| <a name="input_name"></a> [name](#input\_name) | Project name. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->