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