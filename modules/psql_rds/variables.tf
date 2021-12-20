variable "name" {
  type        = string
  description = "Project name."
}

variable "environment" {
  type        = string
  description = "App environment."
}

variable "availability_zones" {
  type        = list(string)
  description = "Database availability zones."
}

variable "engine_version" {
  type        = string
  description = "Aurora PostgreSQL engine version."
  default     = "13.4"
}

variable "instance_class" {
  type        = string
  description = "Database instance class."
  default     = "db.t3.medium"
}

variable "instance_count" {
  type        = number
  description = "Database instance count."
  default     = 1
}