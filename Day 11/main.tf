locals {
  project_name = var.project_name
  upper_project_name = upper(var.project_name)
  lower_project_name = lower(var.project_name)
  replace_project_name = lower(replace(var.project_name, " ", "-"))
  merge_tags = merge(var.default_tags,var.new_tags)
  bucket_name = replace(replace(replace(substr(lower(var.bucket_name), 0, 21), "_", "-"),"$", ""), "#", "")

# Goal: Use split functions to split a string of ports separated by ","
  port_list = split(",",var.ports)
  sg_rules = [for port in local.port_list : {
    name = "port-${port}"
    port = port
    description = "Allow traffic on port ${port}"
  }]

# lookup function
  instance_type = lookup(var.instance_type, "preprod", "t2.medium")
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
