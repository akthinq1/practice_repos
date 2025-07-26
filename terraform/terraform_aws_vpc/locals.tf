locals {
  cidr_block="10.0.0.0/16"
  common_tags={
    Project=var.project_name
    Environment=var.environment
    Terraform=true
  }

  # get availablity zone details from provider using data source
  # slice down for required zones, for example I need first two zones, hence I used slice function and cut it down from 1 to 2
  az_names=slice(data.aws_availability_zones.available.names, 0, 2)
}