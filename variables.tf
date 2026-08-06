variable "environment" {
  type        = string
  description = "Deployment environment name"
  default     = "dev"
}

variable "tags" {
  type = map(string)
  default = {
    "Environment" = "dev"
    "Team" = "DevOps"
    "Organization" = "Cosmos"
  }
}