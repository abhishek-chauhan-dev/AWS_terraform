variable "region" {
    type = string
    description = "define in which region resource will be created"
    default = "us-east-1"
}

variable "bucket_name_list" {
    type = list(string)
    description = "define list of bucket names"
}

variable "tags" {
    type = map(string)
    description = "define tags attached to resource"
}