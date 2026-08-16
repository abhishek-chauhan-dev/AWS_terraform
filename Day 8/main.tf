# Goal: Create multiple S3 buckets of same configuration using List variable
resource "aws_s3_bucket" "bucket_1" {
  count = length(var.bucket_name_list)  
  bucket = var.bucket_name_list[count.index]
  region = var.region
  tags = var.tags
}

# Goal: Create multiple S3 buckets of same configuration using Set variable
resource "aws_s3_bucket" "bucket_2" {
  for_each = var.bucket_name_set
  bucket = each.value
  region = var.region
  tags = var.tags
  
  # defining explicit dependency
  depends_on = [
    aws_s3_bucket.bucket_1
  ]
}

# Goal: Create multiple S3 buckets using a Map variable
resource "aws_s3_bucket" "bucket_3" {
  for_each = var.bucket_name_map
  bucket = each.value
  region = var.region
  tags = var.tags
  depends_on = [ 
    aws_s3_bucket.bucket_1,
    aws_s3_bucket.bucket_2
   ]
}