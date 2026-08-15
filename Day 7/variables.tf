variable "region" {
    type = string
    description = "The AWS region to deploy resources in"
}

variable "tags" {
    type = map(string)
    description = "Tags applied on the resources"
    default = {
        Name = "cosmos-sg"
        Owner = "cosmos"
        Environment = "Dev"
    }
}

variable "ingress_rule" {
    type = object({
        cidr_ipv4   = string
        from_port   = number
        ip_protocol = string
        to_port     = number
    })
    description = "Ingress rule for the security group"
}

variable "instance_type" {
    type = list(string)
    description = "defines the type of EC2 instance"
}

variable "associate_public_ip_address" {
    type = bool
    description = "Whether to associate a public IP address with the instance"
    default = false
}

variable "monitoring" {
    type = bool
    description = "whether to enable monitoring with the instance"
    default = false
}

variable "security_group_name" {
    description = "define security group name"
    type = set(string)
}