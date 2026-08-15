terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-west-2"
}

#Create an S3 bucket
resource "aws_s3_bucket" "first_bucket" {
  bucket = "ubuntu-26-bucket-1"

  tags = {
    Name        = "First Bucket"
    Environment = "Dev"
  }
}