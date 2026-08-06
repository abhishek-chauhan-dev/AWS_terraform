variable "environment" {
  type        = string
  description = "Deployment environment name"
  default     = "dev"
}

variable "bucket_name" {
  type = list(string)
  description = "List of S3 bucket names"
}

variable "tags" {
  type = map(string)
  description = "Tags to apply to resources"
  default = {
    "Environment" = "dev"
    "Team" = "Ubuntu"
    "Organization" = "Deimos"
  }
}