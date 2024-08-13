
terraform {
    backend "s3" {
        # create this S3 bucket first terraform-tfstate-ecsworkshop
        bucket          = "terraform-tfstate-ecsworkshop"
        encrypt         = true
        key             = "terraform"
        region          = "us-east-1"
    }

    required_providers {
        aws = {
            source      = "hashicorp/aws"
            version     = "~> 3.0"
        }
    }
}
