# data "aws_route_table" "main" {
#   vpc_id=data.aws_vpc.default.id

#   filter {
#     name="association.main"
#     values=["true"]
#   }
# }

# Declare the data source
data "aws_availability_zones" "available" {
  state = "available"
}

output "az_info" {
  value=data.aws_availability_zones.available
}