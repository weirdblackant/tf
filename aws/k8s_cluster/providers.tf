terraform {
  required_providers {
    aws={
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
region = "us-east-1"
access_key = var.aws_access_key
secret_key = var.aws_sercret_key
}
