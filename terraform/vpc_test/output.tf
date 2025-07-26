output "vpc_info" {
  value = module.roboshop.vpc_id
}

output "igw_id" {
  value = module.roboshop.igw_id
}
output "az_info" {
  value = module.roboshop.az_info
}

# output "public_subnet_cidr" {
#   value = module.roboshop.public_subnet_cidr[*]
# }
