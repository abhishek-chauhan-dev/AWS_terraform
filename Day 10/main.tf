# Goal: demonstrate conditional expressions
resource "aws_instance" "monday" {
  ami           = "ami-02167eae61967e403"
  instance_type = var.environment == "prod" ? "t1.micro" : "t2.micro"
  region = var.environment == "prod" ? "us-west-1" : "us-west-2"

  tags = {
    Name = "Deimos"
    Owner = "Ubuntu"
    Environment = var.environment
  }
}

# Goal: demonstrate dynamic blocks
resource "aws_security_group" "tuesday" {
  name   = "tuesday-sg"

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port = ingress.value.from_port
      to_port = ingress.value.to_port
      protocol = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }
}

# Goal: Splat expressions
resource "aws_instance" "example" {
  ami           = "ami-02167eae61967e403"
  count = var.instance_count
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}