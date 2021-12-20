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
| <a name="provider_tls"></a> [tls](#provider\_tls) | 3.1.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_autoscaling_group.this](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/autoscaling_group) | resource |
| [aws_autoscaling_policy.this](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/autoscaling_policy) | resource |
| [aws_cloudwatch_metric_alarm.this](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_key_pair.generated_key](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/key_pair) | resource |
| [aws_launch_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/launch_configuration) | resource |
| [aws_ssm_parameter.pem](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/ssm_parameter) | resource |
| [tls_private_key.key](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [aws_iam_instance_profile.selected](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/data-sources/iam_instance_profile) | data source |
| [aws_lb_target_group.selected](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/data-sources/lb_target_group) | data source |
| [aws_security_group.selected](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/data-sources/security_group) | data source |
| [aws_subnets.selected](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/data-sources/subnets) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami"></a> [ami](#input\_ami) | EC2 AMI. | `string` | `"ami-0d06583a13678c938"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | App environment. | `string` | n/a | yes |
| <a name="input_external_target_group_arn"></a> [external\_target\_group\_arn](#input\_external\_target\_group\_arn) | External-managed LB target group ARN | `string` | `""` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | EC2 instance type. | `string` | `"t3.micro"` | no |
| <a name="input_name"></a> [name](#input\_name) | Project name. | `string` | n/a | yes |
| <a name="input_tier"></a> [tier](#input\_tier) | EC2 Tier. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->