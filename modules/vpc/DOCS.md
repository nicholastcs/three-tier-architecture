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

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eip.nats](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/eip) | resource |
| [aws_iam_instance_profile.this](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/iam_instance_profile) | resource |
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.this](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_internet_gateway.igw](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/internet_gateway) | resource |
| [aws_nat_gateway.nats](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/nat_gateway) | resource |
| [aws_route.private](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/route) | resource |
| [aws_route.public](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/route) | resource |
| [aws_route53_zone.private](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/route53_zone) | resource |
| [aws_route_table.private_subnets](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/route_table) | resource |
| [aws_route_table.public_subnets](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/route_table) | resource |
| [aws_route_table_association.private_subnets](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public_subnets](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/route_table_association) | resource |
| [aws_security_group.app_instance](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/security_group) | resource |
| [aws_security_group.db_instance](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/security_group) | resource |
| [aws_security_group.pub_instance](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/security_group) | resource |
| [aws_security_group.web_instance](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/security_group) | resource |
| [aws_subnet.private](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/subnet) | resource |
| [aws_subnet.public](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/subnet) | resource |
| [aws_vpc.this](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | App environment. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Project name. | `string` | n/a | yes |
| <a name="input_private_subnets_configuration"></a> [private\_subnets\_configuration](#input\_private\_subnets\_configuration) | Private subnets configuration. | <pre>list(object({<br>    cidr_block   = string<br>    route_to_nat = bool<br>    zone         = string<br>    type         = string<br>  }))</pre> | `[]` | no |
| <a name="input_public_subnets_configuration"></a> [public\_subnets\_configuration](#input\_public\_subnets\_configuration) | Public subnets configuration. | <pre>list(object({<br>    cidr_block         = string<br>    attach_nat_gateway = bool<br>    zone               = string<br>  }))</pre> | `[]` | no |
| <a name="input_region"></a> [region](#input\_region) | Region. | `string` | n/a | yes |
| <a name="input_vpc_cidr_block"></a> [vpc\_cidr\_block](#input\_vpc\_cidr\_block) | VPC CIDR block. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_info"></a> [info](#output\_info) | n/a |
<!-- END_TF_DOCS -->