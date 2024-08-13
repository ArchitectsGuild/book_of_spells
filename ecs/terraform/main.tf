provider "aws" {
  # profile    = "personal"
  region     = "us-east-1"
}

resource "aws_s3_bucket" "ecsworkshop_bucket" {
  bucket = "terraform-tfstate-ecsworkshop"
  acl    = "private"

  tags = {
    CreatedBy   = "msaavedra91"
    Environment = "dev"
  }
}


