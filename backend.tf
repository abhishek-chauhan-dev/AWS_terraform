terraform {
  backend "s3" {
    key    = "dev/terraform.tfstate"
    bucket = "ubuntu-26.04-cosmos-bucket-remote-backend"
    use_lockfile = true
    region = "us-west-2"
  }
}  