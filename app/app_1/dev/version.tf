terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.67.0"
    }
  }
  required_version = ">=1.0.6"
}

provider "aws" {
  default_tags {
    tags = module.common.tags
  }
  region = "ap-southeast-1"
}