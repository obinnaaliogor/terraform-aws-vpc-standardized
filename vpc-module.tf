module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "4.0.1"
  name =  "${local.name}-${var.vpc_name}"   #"myvpc" #Generally you setup your module b4 variablizing it makes alot of sense. 
                                            #This will make the module portable and production ready
  cidr = var.vpc_cidr_block #10.0.0.0/20

  azs             = var.vpc_availability_zones #["us-east-2a", "us-east-2c"]
  private_subnets = var.vpc_private_subnets #["10.0.0.0/23", "10.0.2.0/23"]
  public_subnets  = var.vpc_public_subnets #["10.0.4.0/23", "10.0.6.0/23"]
  
# NAT gateways for outbound communication
  enable_nat_gateway = var.vpc_enable_nat_gateway  #true
  single_nat_gateway = var.vpc_single_nat_gateway #true

  #create_igw = true, it creates this by default so we didnt have to pass it

  database_subnets = var.vpc_database_subnets #["10.0.8.0/23", "10.0.10.0/23"]
  create_database_subnet_group = var.vpc_create_database_subnet_route_table #true
  create_database_subnet_route_table = var.vpc_create_database_subnet_route_table #true

#DNS parameter
  enable_dns_hostnames = true
  enable_dns_support = true


  private_subnet_tags = {
    type = "private_subnets"
  }
  
  public_subnet_tags = {
    type = "public_subnets"
  }

database_subnet_tags = {
    type = "private_database_subnets"
  }

  vpc_tags = local.common_tags

  tags = local.common_tags
  
}

