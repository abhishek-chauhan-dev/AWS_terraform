# Goal:
# 1. Create an IAM user
# 2. Create an IAM policy with permissions to list images (AMI)
# 3. Attach the policy with user

# 1. Create an IAM user

resource "aws_iam_user" "saturn" {
  name = "saturn"
  path = "/dev/"

  tags = {
    environment = "dev"
    owner = "cosmos"
  }
}

# 2. Create an IAM policy with permissions to list images (AMI)
# 3. Attach the policy with user

resource "aws_iam_user_policy" "lb_ro" {
  user = aws_iam_user.saturn.name
  policy = <<EOT
  {
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Statement1",
      "Effect": "Allow",
      "Action": [
        "ec2:DescribeImages",
        "ec2:DescribeInstances"
      ],
      "Resource": "*"
    }
  ]
}
EOT
}
