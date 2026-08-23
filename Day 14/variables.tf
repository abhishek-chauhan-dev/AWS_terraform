variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "common_tags" {
  type = map(string)
  default = {
    "Name" = "phobos"
    "Environment" = "Dev"
  }
}

variable "subnet_cidr" {
  type = string
  default = "10.0.1.0/24"
}

variable "ingress_rules" {
  type = list(object({
    cidr_ipv4 = string
    from_port = number
    ip_protocol = string
    to_port = number
  }))

  default = [ {
    cidr_ipv4 = "182.77.65.134/32"
    from_port = 22
    ip_protocol = "tcp"
    to_port = 22
  },
  {
    cidr_ipv4 = "0.0.0.0/0"
    from_port = 80
    ip_protocol = "tcp"
    to_port = 80
  }, 
  {
    cidr_ipv4 = "0.0.0.0/0"
    from_port = 443
    ip_protocol = "tcp"
    to_port = 443
  } ]
}

variable "instance_type" {
  type = string
  default = "t3.micro"
}