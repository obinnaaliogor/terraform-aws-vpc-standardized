terraform {
  required_version = "~> 1.4"       #1.4.4/5/6/7 1.4/5/6/7 Terraform version for running the code
  required_providers {
    aws = {
      source  = "hashicorp/aws" #aws plugin version 3.0
      version = "~> 4.0"
      #constrained the aws version to the right most value, any version from 3.0 above will be supported
    }
  }
}
/*
backend "s3" {
    bucket = "obinnatfstate-bucket"
    key = "terraform/tfstate.tfstate"
    region = "us-east-2"
    dynamodb_table = "terraform-lock" #This lock wont be released even after destroying the dynamodb_table
                                      # to release the lock run terraform destroy --lock=false
  }
}
*/


/*
output "datatfrs" {
  value = data.terraform_remote_state.network.outputs.public_subnets
}
*/

/*
This a new configuration for s3 bucket by aws from April 2023
resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-terraformstate-obinna-buc"

  tags = {
    Name        = "My terraform-bucket"
    Environment = "Dev"
  }
}
resource "aws_s3_bucket_ownership_controls" "bucket_control" {
  bucket = aws_s3_bucket.my_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }

}

resource "aws_s3_bucket_acl" "bucket_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.bucket_control]

  bucket = aws_s3_bucket.my_bucket.id
  acl    = "private"
}
*/

provider "aws" {
  region = var.region #Here iam passing the provider as a variable
  profile = var.profile
}

# AWS Region
variable "region" {
  description = "Region in which AWS Resources will be created"
  type = string
  default = "us-east-2"

}

variable "profile" {
  type = string
  default = "obinna"
}

/*
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
   prevent_destroy = true #Prevents accidental deletion of resources.
 }
}
*/

module "ec2" {
  source            = "./module"
  instance_key      = "app"
  ingressrule       = [80, 443, 8080, 22]
  egressrule        = [80, 443, 25, 3306, 53, 8080]
  instancetype_list = ["t2.micro", "t2.medium", "t3.micro", "t2.small"]
  names_server      = ["Dev", "UAT", "Prod", "sales"]
  user-data = file("./httpd.sh")
}
#Very important:
#Though we have output block in our module but we dont seem to get or see those attribute after apply while calling our module
#This is because to get an output of a module outside the module, you will have to create an output block in the module calling file

output "PublicIP" {
value = module.ec2.PublicIP #module.modulename.name of your output block or label in the module
}

output "instance_id" {
value = module.ec2.instance_id
}

output "amidata" {
value = module.ec2.amidata
}
output "Internet_traffic" {
value = module.ec2.Internet_traffic
}