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