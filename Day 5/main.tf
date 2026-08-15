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
  region = local.region
}

terraform {
  backend "s3" {
    bucket = "ubuntu-26.04-cosmos-remote-backend"
    key    = "dev/terraform.tfstate"
    region = "us-west-2"
    use_lockfile = true
    encrypt = true
  }
}

variable "region" {
    description = "The AWS region to create resources in"
    default = "us-west-2"
    type = string
}

variable "zone" {
    description = "The AWS availability zone to create resources in"
    default = "us-west-2a"
    type = string
}

variable "owner" {
    description = "The name of the resource."
    type = string
    default = "Cosmos"
}

variable "environment" {
    description = "defines the environment for the resources"
    type = string
    default = "Dev"
}

variable "instance_type" {
    description = "defines instance type of EC2 instance"
    type = string
    default = "t3.micro"
}

variable "name" {
    description = "defines name of the resource"
    type = string
    default = "first"
}

locals {
    region = var.region
    zone = var.zone
    owner = var.owner
    environment = var.environment
    instance_type = var.instance_type
    name = var.name
}

output "first_bucket_name" {
    value = aws_s3_bucket.first_bucket.bucket
}

output "second_bucket_name" {
    value = aws_s3_bucket.second_bucket.bucket
}

output "first_ec2_instance" {
    value = aws_instance.first_ec2_instance.id
}

# Create a S3 bucket
resource "aws_s3_bucket" "first_bucket" {
  bucket = "ubuntu-26.04-cosmos-${local.name}-first-bucket"

  tags = {
    Name        = "${local.name} S3 Bucket"
    Environment = local.environment
    Owner = local.owner
  }
}

#Create a S3 bucket
resource "aws_s3_bucket" "second_bucket" {
  bucket = "ubuntu-26.04-cosmos-${local.name}-second-bucket"

  tags = {
    Name        = "Second S3 Bucket"
    Environment = local.environment
    Owner = local.owner
  }
}

#Create an EC2 instance
resource "aws_instance" "first_ec2_instance" {
  ami           = "ami-0fb110df4c5094d21"
  instance_type = local.instance_type
  region = local.region
  availability_zone = local.zone

  tags = {
    Name = "${local.name} EC2 Instance"
    Environment = local.environment
    Owner = local.owner
  }
}