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

| Name | Source | Version |
|------|--------|---------|
| <a name="module_this"></a> [this](#module\_this) | ../../modules/launch_template/ | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_lb_listener_rule.this](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/lb_listener_rule) | resource |
| [aws_lb_target_group.this](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/lb_target_group) | resource |
| [aws_lb.this](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/data-sources/lb) | data source |
| [aws_lb_listener.http](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/data-sources/lb_listener) | data source |
| [aws_vpc.selected](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami"></a> [ami](#input\_ami) | EC2 AMI. | `string` | `"ami-0d06583a13678c938"` | no |
| <a name="input_app_name"></a> [app\_name](#input\_app\_name) | Application Name. | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | App environment. | `string` | n/a | yes |
| <a name="input_health_check_path"></a> [health\_check\_path](#input\_health\_check\_path) | Health Check path. | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | EC2 instance type. | `string` | `"t3.micro"` | no |
| <a name="input_name"></a> [name](#input\_name) | Project name. | `string` | n/a | yes |
| <a name="input_paths"></a> [paths](#input\_paths) | Listener rule route paths. | `list(string)` | n/a | yes |
| <a name="input_tier"></a> [tier](#input\_tier) | EC2 Tier. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->