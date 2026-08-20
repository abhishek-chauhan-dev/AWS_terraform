variable "project_name" {
    type = string
    description = "defines name of the project"
    default = "AWS terraform on Ubuntu"
}

variable "default_tags" {
    type = map(string)
    default = {
      "environment" = "stage"
      "owner" = "cosmonaut"
    }
    description = "defines the environment and owner of the resource"
}

variable "new_tags" {
    type = map(string)
    default = {
      "hostname" = "cosmos"
      "distribution" = "ubuntu"
    }    
    description = "defines the hostname and distribution of the resource"
}

variable "bucket_name" {
    type = string
    default = "Ubuntu_#26.04$_cosmos_Tf_Bucket"
}

variable "ports" {
    type = string
    default = "80,443,22,6443"
}

variable "instance_type" {
    type = map(string)
    default = {
      "dev" = "t1.micro"
      "stage" = "t2.micro"
      "prod" = "t3.micro"
    }
}

variable "environment" {
    type = string
    default = "dev"
}