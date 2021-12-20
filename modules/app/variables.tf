variable "app_name" {
  type        = string
  description = "Application Name."
}

variable "paths" {
  type        = list(string)
  description = "Listener rule route paths."
}

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

variable "health_check_path" {
  type        = string
  description = "Health Check path."
}