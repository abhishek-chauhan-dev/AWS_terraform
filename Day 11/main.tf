locals {
  project_name = var.project_name
  upper_project_name = upper(var.project_name)
  lower_project_name = lower(var.project_name)
  replace_project_name = lower(replace(var.project_name, " ", "-"))
  merge_tags = merge(var.default_tags,var.new_tags)
  bucket_name = substr(lower(var.bucket_name), 0, 20)
}

# Goal: Use collection functions [merge function]
resource "aws_instance" "wednesday" {
  ami           = "ami-02167eae61967e403"
  instance_type = "t2.micro"

  tags = local.merge_tags
}

# Goal: Use substring functions
resource "aws_s3_bucket" "wednesday" {
  bucket = local.bucket_name

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}