output "vpc_id" {
  value=aws_vpc.main.id
}

output "igw_id" {
  value = aws_internet_gateway.main.id
}

output "public_subnet_id" {
  value=aws_subnet.public[*].id
  
}

# output "public_subnet_cidr" {
#   value = aws_subnet.public.cidr_block
# }