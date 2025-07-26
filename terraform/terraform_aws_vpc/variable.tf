variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "vpc_cidr_block" {
  type = string
}

variable "vpc_tags" {
  type    = map(string)
  default = {}
}

variable "igw_tags" {
  type    = map(string)
  default = {}
}

variable "public_subnet_cidr" {
  type = list(any)
}

variable "public_subnet_tags" {
  type    = map(string)
  default = {}
}

variable "private_subnet_tags" {
  type = map(string)
  default={}
}

variable "private_subnet_cidr" {
  type=list()
}

variable "database_subnet_cidr" {
  type=list()
}

variable "database_subnet_tags" {
  type = map(string)
  default={}
}