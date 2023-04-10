terraform {
required_version = "~> 1.4"       #1.4.4/5/6/7 1.4/5/6/7 Terraform version for running the code
required_providers {
aws = {
source  = "hashicorp/aws" #aws plugin version 3.0 
version = "~> 4.0" #constrained the aws version to the right most value, any version from 3.0 above will be supported
}
}
backend "s3" {
    bucket = "obinnatfstate-bucket"
    key = "prod/tfstate.tfstate"
    region = "us-east-2"

  }

}
provider "aws" {
  region = var.region #Here iam passing the provider as a variable 
  profile = var.profile
}

