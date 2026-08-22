variable "security_group" {
  type = string
  default = "cosmos-sg"
}

variable "ingress" {
  type = object({
    from_port = number
    to_port = number
    protocol = string
  })
  default = {
    from_port = 80
    to_port = 80
    protocol = "tcp"
  }
}

variable "egress" {
  type = object({
    from_port = number
    to_port = number
    protocol = string
  })
  default = {
    from_port = 80
    to_port = 80
    protocol = "tcp"
  }
}

variable "tags" {
  type = map(string)
  default = {
    "name" = "cosmos"
    "environment" = "dev"
  }
}