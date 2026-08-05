resource "aws_s3_bucket" "ubuntu" {
  bucket = "ubuntu-26.04-cosmos-bucket-05082026"

  tags = {
    Name        = "${local.environment}-bucket"
    Environment = local.environment
  }
}


