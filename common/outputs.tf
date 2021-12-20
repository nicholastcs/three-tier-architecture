locals {
  project_name = "tutorial"
}

output "tags" {
  value = {
    "Full Project Name" = "${local.project_name}-${var.environment}"
    "Project Name"      = local.project_name
    "Cost Centre"       = var.cost_centre
    "Environment"       = var.environment
    "Terraform"         = true
  }
  description = "Standardized tagging for resource grouping and management."
}

output "name" {
  value = local.project_name
}

output "environment" {
  value = var.environment
}