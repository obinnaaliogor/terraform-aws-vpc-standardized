terraform {
  required_version = "~> 1.4"       #1.4.4/5/6/7 1.4/5/6/7 Terraform version for running the code
  required_providers {
    aws = {
      source  = "hashicorp/aws" #aws plugin version 3.0
      version = "~> 4.0"
      #constrained the aws version to the right most value, any version from 3.0 above will be supported
    }
  }
  
backend "s3" {
    bucket = "obinnatfstate-bucket"
    key = "terraform/tfstate.tfstate"
    region = "us-east-2"
    dynamodb_table = "terraform-lock"

  }
}

provider "aws" {
  region = var.region #Here iam passing the provider as a variable 
  profile = var.profile
}

resource "aws_dynamodb_table" "state-lock" {
  name             = "terraform-lock"
  hash_key         = "LockID"
   read_capacity  = 3
   write_capacity = 3

  attribute {
    name = "LockID"
    type = "S"
  }
  

tags = {
  "Name" = "Terraform Lock Table-Prod"
}
lifecycle {
   prevent_destroy = false
 }
}
