resource "aws_security_group" "aws_sg" {
  vpc_id = data.aws_vpc.vpc.id
  name = var.security_group
  tags = var.tags

  ingress {
    cidr_blocks = [data.aws_subnet.subnet.cidr_block]
    from_port   = var.ingress.from_port
    to_port     = var.ingress.to_port
    protocol    = var.ingress.protocol
  }

  egress {
    cidr_blocks = [data.aws_subnet.subnet.cidr_block]
    from_port   = var.egress.from_port
    to_port     = var.egress.to_port
    protocol    = var.egress.protocol
  }
}