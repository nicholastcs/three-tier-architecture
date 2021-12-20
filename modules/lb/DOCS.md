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
| [aws_lb.internal](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/lb) | resource |
| [aws_lb.public](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/lb) | resource |
| [aws_lb_listener.internal_http](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/lb_listener) | resource |
| [aws_lb_listener.tcp](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/lb_listener) | resource |
| [aws_lb_listener.tls](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.tcp](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/lb_target_group) | resource |
| [aws_acm_certificate.this](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/data-sources/acm_certificate) | data source |
| [aws_security_group.app_instance](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/data-sources/security_group) | data source |
| [aws_subnets.private_app_selected](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/data-sources/subnets) | data source |
| [aws_subnets.selected](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/data-sources/subnets) | data source |
| [aws_vpc.selected](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_certificate_domain"></a> [certificate\_domain](#input\_certificate\_domain) | Certificate domain, eg: `*.tutorial.com`. | `string` | `""` | no |
| <a name="input_enforce_tls"></a> [enforce\_tls](#input\_enforce\_tls) | Enforce TLS at internet facing NLB. | `bool` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | App environment. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Project name. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->