output "vpc_id" {
  value = data.aws_vpc.vpc.id
}

output "vpc_cidr" {
  value = data.aws_vpc.vpc.cidr_block
}

output "subnet_id" {
  value = data.aws_subnet.subnet.id
}

output "subnet_cidr" {
  value = data.aws_subnet.subnet.cidr_block
}

output "sg_id" {
  value = aws_security_group.aws_sg.id
}

output "tags" {
  value = var.tags
}