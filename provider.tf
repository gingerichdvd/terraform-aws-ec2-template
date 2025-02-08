terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.6"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-west-2"
}
