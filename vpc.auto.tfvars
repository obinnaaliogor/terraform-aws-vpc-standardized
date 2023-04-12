# VPC Variables
vpc_name = "myvpc"
vpc_cidr_block = "10.0.0.0/20"
vpc_availability_zones = ["us-east-2a", "us-east-2b"]
vpc_public_subnets = ["10.0.4.0/23", "10.0.6.0/23"]
vpc_private_subnets =  ["10.0.0.0/23", "10.0.2.0/23"]
vpc_database_subnets= ["10.0.8.0/23", "10.0.10.0/23"]
vpc_create_database_subnet_group = true
vpc_create_database_subnet_route_table = true   
vpc_enable_nat_gateway = true  
vpc_single_nat_gateway = true
#business_division = "Finance" since i commented on this, terraform init will read the value from terraform.tfvars
region = "us-east-2" /*had this error |
Error: creating EC2 Subnet: InvalidParameterValue: Value (us-east-2b) for parameter availabilityZone is invalid. Subnets can currently only be created in the following availability zones: us-east-1a, us-east-1b, us-east-1c, us-east-1d, us-east-1e, us-east-1f.
│       status code: 400, request id: b2dcd425-c396-46ce-895d-ed8e2cf6d9fe
│ 
│   with module.vpc.aws_subnet.database[1],
│   on .terraform/modules/vpc/main.tf line 345, in resource "aws_subnet" "database":
│  345: resource "aws_subnet" "database"
Solution was by passing the argument "region" in the vpc.auto.tfvars file, which is required in creating a subnet {*/
