variable "environment" {
  type = string
  validation {
    condition     = contains(["dev", "uat", "prod"], var.environment)
    error_message = "The var.environment must be `dev`, `uat` or `prod` only."
  }
}

variable "cost_centre" {
  type = string
  validation {
    condition     = length(trim(var.cost_centre, " ")) > 0
    error_message = "The var.cost_centre must be not empty or whitespace."
  }
}