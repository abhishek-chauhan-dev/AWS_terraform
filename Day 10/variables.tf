variable "environment" {
    type = string
    description = "tells which environment resource belongs to"
    default = "dev"
}

variable "region" {
    type = string
    description = "tells in which region resource will be created"
    default = "us-west-2"
}

variable "ingress_rules" {
    description = "define security group rules for incoming traffic"
    type = list(object({
      from_port = number
      to_port = number
      protocol = string
      cidr_blocks = list(string)
    }))
    default = [ {
       from_port = 80
       to_port = 80
       protocol = "TCP"
       cidr_blocks = [ "10.0.0.0/8" ]
    },
    {
       from_port = 443
       to_port = 443
       protocol = "TCP"
       cidr_blocks = [ "10.0.0.0/8" ]
    } ]
}

variable "instance_count" {
    type = number
    description = "define number of EC2 instances be created"
    default = 5
}