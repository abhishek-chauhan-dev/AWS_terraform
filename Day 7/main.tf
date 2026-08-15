resource "aws_security_group" "first_security_group" {
  name        = tolist(var.security_group_name)[2]
  description = "This security group belongs to cosmos owner"
  region = var.region
  tags = var.tags
}

resource "aws_vpc_security_group_ingress_rule" "first_ingress_rule" {
  security_group_id = aws_security_group.first_security_group.id
  region = var.region

  cidr_ipv4   = var.ingress_rule.cidr_ipv4
  from_port   = var.ingress_rule.from_port
  ip_protocol = var.ingress_rule.ip_protocol
  to_port     = var.ingress_rule.to_port
}

resource "aws_instance" "demo_instance" {
  ami           = "ami-091124c3965bce679"
  instance_type = var.instance_type[0]
  associate_public_ip_address = var.associate_public_ip_address
  monitoring = var.monitoring
  tags = var.tags
}