
variable "vpc_name" {
  type = string
  description = "Vpc name"
  default = "myvpc" 
}
variable "vpc_cidr_block" {
  type = string
  description = "Vpc cidr block range"
  default = "10.0.0.0/20" 
}

variable "vpc_availability_zones" {
  type = list(string)
  description = "A list of availability zones names or ids in the region"
  default = [ "us-east-2a", "us-east-2c" ]
}
variable "vpc_private_subnets" {
  type = list(string)
  description = "A list of private subnets inside the VPC"
  default = ["10.0.0.0/23", "10.0.2.0/23"]
}

variable "vpc_public_subnets" {
  type = list(string)
  description = "A list of public subnets inside the VPC"
  default =  ["10.0.4.0/23", "10.0.6.0/23"]
}


variable "vpc_enable_nat_gateway" {
  type = bool
  default = true
}
variable "vpc_single_nat_gateway" {
type = bool
default = true
}

/*
variable "vpc_enable_dns_support" {
  type = bool
  #default = true
}
variable "vpc_nable_dns_hostnames" {
  type = bool
  #default = true
}
 */

variable "vpc_database_subnets" {
  type = list(string)
  description = "A list of database subnets inside the VPC"
  default = ["10.0.8.0/23", "10.0.10.0/23"]
}
variable "vpc_create_database_subnet_route_table" {
  type = bool
  default = true
}
variable "vpc_create_database_subnet_group" {
  type = bool
  default = true
}

/*
variable "vpc_private_subnet_tags" {
  type = map(string)
description = "Additional tags for the private subnets"
  default = {
type = "vpc_private_subnets"
  }
}


variable "vpc_public_subnet_tags" {
  type = map(string)
description = "Additional tags for the private subnets"
  default = {
type = "public_subnets"
  }
}
*/