#Goal: create a S3 bucket with Lifecycle Rules [prevent_destroy; create_before_destroy; ignore_changes]
resource "aws_s3_bucket" "pre-prod_bucket" {
  bucket = "ubuntu-26.04-pre-prod-tf-bucket"
  region = "us-west-1"
  object_lock_enabled  = true
  tags = {
    Name        = "pre-prod_bucket"
    Environment = "pre-prod"
    Owner = "cosmos"
  }
  lifecycle {
   prevent_destroy = false
   create_before_destroy = true
   ignore_changes = [tags, bucket]
  }
}

# Goal: implement replace_triggered_by lifecycle rule
resource "aws_key_pair" "tf_key-pair" {
  key_name   = "tf-key"
  region = "us-west-2"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICeXrw+0DnV0AIiBABQ2haseEBqanDuk5b04fh9ZKnb1 abhishek-chauhan@Cosmos"
}

resource "aws_instance" "test-instance" {
  ami           = "ami-02167eae61967e403"
  instance_type = "t1.micro"
  key_name = aws_key_pair.tf_key-pair.key_name
  region = "us-west-2"

  tags = {
    Name = "Titan"
    Owner = "Cosmos"
  }

  depends_on = [ aws_key_pair.tf_key-pair ]

  lifecycle { 
   replace_triggered_by = [ aws_key_pair.tf_key-pair ]
  }
}

resource "aws_instance" "test-instance" {
  ami           = "ami-02167eae61967e403"
  instance_type = "t1.micro"
  region = "us-west-2"

  tags = {
    Name = "Titan"
    Owner = "Cosmos"
  }

  lifecycle { 
   precondition {
      condition     = var.environment == "prod"
      error_message = "Environment not set to prod"
    }
  }
}