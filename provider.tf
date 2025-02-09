# Defines AWS as provider where given resources will be created
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.6"
    }
  }
}

# Configure the AWS Provider region
provider "aws" {
  region  = "us-west-2"
}
