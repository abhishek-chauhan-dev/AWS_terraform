output "vpc_id" {
  value = aws_vpc.phobos_vpc.id
}

output "subnet_id" {
  value = aws_subnet.phobos_subnet.id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.phobos_igw.id
}

output "route_table_id" {
  value = aws_route_table.phobos_rt.id
}

output "instance_id" {
  value = aws_instance.phobos_instance.id
}