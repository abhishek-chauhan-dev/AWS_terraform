resource "aws_instance" "monday" {
  ami           = "ami-02167eae61967e403"
  instance_type = var.environment == "dev" ? "t1.micro" : "t2.micro"
  region = var.environment == "dev" ? var.region : "us-west-1"

  tags = {
    Name = "Deimos"
    Owner = "Ubuntu"
    Environment = var.environment
  }
}