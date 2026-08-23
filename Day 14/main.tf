# Goal: Create a VPC
resource "aws_vpc" "phobos_vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames = "true"
  tags = var.common_tags
}

# Goal: Create a Subnet
resource "aws_subnet" "phobos_subnet" {
  vpc_id     = aws_vpc.phobos_vpc.id
  cidr_block = var.subnet_cidr
  map_public_ip_on_launch = "true"
  tags = var.common_tags
}

# Goal: Create an Internet Gateway
resource "aws_internet_gateway" "phobos_igw" {
  vpc_id = aws_vpc.phobos_vpc.id
  tags = var.common_tags  
}

# Goal: Create a Route table
resource "aws_route_table" "phobos_rt" {
  vpc_id = aws_vpc.phobos_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.phobos_igw.id
  }

  tags = var.common_tags
}

# Goal: Associate the route table with subnet
resource "aws_route_table_association" "phobos_rta" {
  subnet_id      = aws_subnet.phobos_subnet.id
  route_table_id = aws_route_table.phobos_rt.id
}

# Goal: Create a Security Group
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.phobos_vpc.id

  tags = var.common_tags
}

# Goal: Define inbound rules
resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  count = length(var.ingress_rules)

  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = var.ingress_rules[count.index].cidr_ipv4
  from_port         = var.ingress_rules[count.index].from_port
  ip_protocol       = var.ingress_rules[count.index].ip_protocol
  to_port           = var.ingress_rules[count.index].to_port
}

# Goal: Define outbound rules
resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

# Goal: Create a Key-pair
resource "aws_key_pair" "deployer" {
  key_name   = "phobos-key"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILCAjEQEDk8FHS8FdVz49nbuDmYPC95ltBKGLqFWn3hq abhishek-chauhan@Cosmos"
}

# Goal: Create an EC2 instance
resource "aws_instance" "phobos_instance" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  associate_public_ip_address = true
  key_name = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  subnet_id = aws_subnet.phobos_subnet.id
  tags = var.common_tags

  # Meta arguments
  depends_on = [ aws_security_group.allow_tls ]
}