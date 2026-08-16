# Create multiple S3 buckets of same configuration
resource "aws_s3_bucket" "bucket_1" {
  count = length(var.bucket_name_list)  
  bucket = var.bucket_name_list[count.index]
  region = var.region
  tags = var.tags
}