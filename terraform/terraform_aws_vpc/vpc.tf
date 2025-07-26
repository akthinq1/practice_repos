resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = "default"
  enable_dns_hostnames = "true"

  tags = merge(
    var.vpc_tags,
    local.common_tags,
    {
        Name="${var.project_name}-${var.environment}"
    }
  )
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags =merge(
    var.igw_tags,
    local.common_tags,
     {
    Name = "${var.project_name}-${var.environment}-igw"
  }
  )
}

# roboshop-dev-us-east-1a, roboshop-dev-us-east-1b
# use datasource to get information from provider to for naming the subnet in the particular region, where we already selected region in provider
# data source aws availablity zones terraform
resource "aws_subnet" "public" {
  count = length(var.public_subnet_cidr)
  vpc_id = aws_vpc.main.id
  cidr_block = var.public_subnet_cidr[count.index]

  # get availablity zone details from provider using data source
  availability_zone = local.az_names[count.index]

  # used for indicate that instances launched into the subnet should be assigned to public IP
  map_public_ip_on_launch = true

  tags = merge(
    var.public_subnet_tags,
    local.common_tags,
    {
      Name="${var.project_name}-${var.environment}-public-${local.az_names[count.index]}"
    }
  )
}

resource "aws_subnet" "private" {
  count = length(var.private_subnet_cidr)
  vpc_id = aws_vpc.main.id
  cidr_block = var.private_subnet_cidr[count.index]

  # get availablity zone details from provider using data source
  availability_zone = local.az_names[count.index]

   tags = merge(
    var.private_subnet_tags,
    local.common_tags,
    {
      Name="${var.project_name}-${var.environment}-private-${local.az_names[count.index]}"
    }
  )
}

resource "aws_subnet" "database" {
  count=length(var.database_subnet_cidr)
  vpc_id=aws_vpc.main.id
  cidr_block = var.database_subnet_cidr[count.index]

  availability_zone = local.az_names[count.index]

  tags = merge(
    var.database_subnet_tags,
    local.common_tags,
    {
      Name="${var.project_name}-${var.environment}-database-${local.az_names[count.index]}"
    }
  )
}