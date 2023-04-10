
output "azs" {
value = module.vpc.azs
}

output "vpc_id" {
  value = module.vpc.vpc_id
  }

output "vpc_cidr_block" {
    value = module.vpc.vpc_cidr_block
}

output "database_subnets" {
  value = module.vpc.database_subnets
}

output "database_route_table_ids" {
value = module.vpc.database_route_table_ids
}

output "database_subnet_group" {
  value = module.vpc.database_subnet_group
}

output "nat_public_ips" {
  value = module.vpc.nat_public_ips
}

output "private_route_table_ids" {
  value = module.vpc.private_route_table_ids
}

output "private_subnets" {
  value = module.vpc.private_subnets
}
output "private_subnets_cidr_blocks" {
  value = module.vpc.private_subnets_cidr_blocks
}

output "public_route_table_ids" {
  value = module.vpc.public_route_table_ids
}

output "public_subnets" {
  value = module.vpc.public_subnets
}