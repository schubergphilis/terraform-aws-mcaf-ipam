output "ipam_pool_id" {
  description = "The ID of the AWS IPAM pool"
  value       = aws_vpc_ipam_pool.aws_pool.id
}

output "ipam_sub_pools_ids" {
  description = "The IDs of the sub pools of the AWS IPAM pool"
  value = {
    for pool in local.pool_cidr : pool.name => aws_vpc_ipam_pool.environment[pool.name].id
  }
}