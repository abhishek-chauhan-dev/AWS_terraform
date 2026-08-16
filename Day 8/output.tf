output "bucket_name_list" {
    value = aws_s3_bucket.bucket_1[*].bucket
}

output "tags" {
    value = aws_s3_bucket.bucket_1[*].tags
}