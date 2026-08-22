data "aws_vpc" "vpc" {
  filter {
      name   = "tag:Name"
      values = ["default-vpc"]
    }
}

data "aws_subnet" "subnet" {
  filter {
    name = "tag:Name"
    values = ["subnet-0cd1"]
  }
}