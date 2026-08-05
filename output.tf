output "bucket_name" {
   value = aws_s3_bucket.ubuntu.bucket
 }

 output "bucket_tags" {
    value = aws_s3_bucket.ubuntu.tags
 }