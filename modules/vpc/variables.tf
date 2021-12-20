variable "name" {
  type        = string
  description = "Project name."
}

variable "environment" {
  type        = string
  description = "App environment."
}

variable "region" {
  type        = string
  description = "Region."
}

variable "public_subnets_configuration" {
  type = list(object({
    cidr_block         = string
    attach_nat_gateway = bool
    zone               = string
  }))
  description = "Public subnets configuration."
  default     = []
}

variable "private_subnets_configuration" {
  type = list(object({
    cidr_block   = string
    route_to_nat = bool
    zone         = string
    type         = string
  }))
  description = "Private subnets configuration."
  default     = []
}

variable "vpc_cidr_block" {
  type        = string
  description = "VPC CIDR block."
}