terraform {
  backend "s3" {
    bucket       = "terra-state-bucket-26"  #aws s3 mb s3://terra-state-bucket-26 --region ap-south-1  cmd use for create  backend s3 bucket before you mention in youur backend optins.
    key          = "dev/terraform.tfstate"
    region       = "ap-south-1"
    encrypt      = true
    use_lockfile = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# AWS Provider
provider "aws" {
  region = "ap-south-1"
}

# Create application S3 bucket (NOT backend bucket)
resource "aws_s3_bucket" "my_bucket" {
  bucket = "day04-tf-bucket-2026"

  tags = {
    Name        = "day04-tf-bucket-2026"
    Environment = "dev"
  }
}
