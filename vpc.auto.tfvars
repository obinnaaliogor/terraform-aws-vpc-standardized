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