variable "name" {
  type        = string
  description = "Project name."
}

variable "environment" {
  type        = string
  description = "App environment."
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type."
  default     = "t3.micro"
}

variable "ami" {
  type        = string
  description = "EC2 AMI."
  default     = "ami-0d06583a13678c938"
}

variable "tier" {
  type        = string
  description = "EC2 Tier."
}


variable "external_target_group_arn" {
  type        = string
  description = "External-managed LB target group ARN"
  default     = ""
}