variable "region" {
    description = "The AWS region to create resources in"
    default = "us-west-2"
    type = string
}

variable "zone" {
    description = "The AWS availability zone to create resources in"
    default = "us-west-2a"
    type = string
}

variable "owner" {
    description = "The name of the resource."
    type = string
    default = "Cosmos"
}

variable "environment" {
    description = "defines the environment for the resources"
    type = string
    default = "Dev"
}

variable "instance_type" {
    description = "defines instance type of EC2 instance"
    type = string
    default = "t3.micro"
}

variable "name" {
    description = "defines name of the resource"
    type = string
    default = "first"
}