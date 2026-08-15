output "first_bucket_name" {
    value = aws_s3_bucket.first_bucket.bucket
}

output "second_bucket_name" {
    value = aws_s3_bucket.second_bucket.bucket
}

output "first_ec2_instance" {
    value = aws_instance.first_ec2_instance.id
}