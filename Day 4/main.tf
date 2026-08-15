terraform {
  backend "s3" {
    bucket = "ubuntu-26.04-cosmos-remote-backend"
    key    = "dev/terraform.tfstate"
    region = "us-west-2"
    use_lockfile = true
    encrypt = true
  }

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

#Create a S3 bucket for Dev environment
resource "aws_s3_bucket" "bucket-1" {
  bucket = "ubuntu-26.04-cosmos-first-bucket"

  tags = {
    Name        = "First S3 Bucket"
    Environment = "Dev"
  }
}

#Create a S3 bucket for stage environment
resource "aws_s3_bucket" "bucket-2" {
  bucket = "ubuntu-26.04-cosmos-second-bucket"

  tags = {
    Name        = "Second S3 Bucket"
    Environment = "Stage"
  }
}