variable "environment" {
  type        = string
  description = "Deployment environment name"
  default     = "dev"
}

variable "bucket_name" {
  type = set(string)
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

variable "security_group" {
  type = tuple([string, number, number, string, string])
  description = "Security group rule parameters: [type, from_port, to_port, protocol, region]"
}