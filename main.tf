resource "aws_s3_bucket" "ubuntu" {
  bucket = "ubuntu-26.04-cosmos-bucket-06082026"

  tags = var.tags
}


