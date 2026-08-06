resource "aws_s3_bucket" "ubuntu" {
  bucket = tolist(var.bucket_name)[0]

  tags = var.tags
}

resource "aws_s3_bucket" "ubuntu1" {
  bucket = tolist(var.bucket_name)[1]

  tags = var.tags
}

# GOAL - To create a security group rule using tuple.

resource "aws_security_group_rule" "csat1b-sgr" {
  type              = var.security_group[0]
  from_port         = var.security_group[1]
  to_port           = var.security_group[2]
  protocol          = var.security_group[3]
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "sg-123456"
  region            = var.security_group[4]
}