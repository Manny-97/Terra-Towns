terraform {
    required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.21.0"
    }
  }
}

data "aws_caller_identity" "current" {}