terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.98.0"
    }
  }

#   backend "s3" {
#     bucket = "akdevops-terraform-remote-state"
#     key    = "vpc-test"
#     region = "us-east-1"
#     encrypt        = true
#     use_lockfile = true
#   }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}