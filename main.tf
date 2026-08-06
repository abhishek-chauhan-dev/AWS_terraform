resource "aws_s3_bucket" "ubuntu" {
  bucket = tolist(var.bucket_name)[0]

  tags = var.tags
}

resource "aws_s3_bucket" "ubuntu1" {
  bucket = tolist(var.bucket_name)[1]

  tags = var.tags
}