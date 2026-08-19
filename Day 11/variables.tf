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
    default = "Ubuntu_26.04_cosmos_Tf_Bucket"
}