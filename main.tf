resource "aws_s3_bucket" "ubuntu" {
  bucket = var.bucket_name[0]

  tags = var.tags
}

resource "aws_s3_bucket" "ubuntu1" {
  bucket = var.bucket_name[1]

  tags = var.tags
}