variable "name" {
  type        = string
  description = "Project name."
}

variable "environment" {
  type        = string
  description = "App environment."
}

variable "enforce_tls" {
  type        = bool
  description = "Enforce TLS at internet facing NLB."
}

variable "certificate_domain" {
  type        = string
  description = "Certificate domain, eg: `*.tutorial.com`."
  default     = ""
}