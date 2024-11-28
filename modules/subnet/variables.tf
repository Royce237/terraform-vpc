variable "vpc_id" {
  description = "VPC ID where the subnets will be created"
  type        = string
}

variable "public_cidr_block" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "private_cidr_block" {
  description = "CIDR block for the private subnet"
  type        = string
}

variable "availability_zone" {
  description = "The availability zone to create subnets in"
  type        = string
}

variable "public_subnet_name" {
  description = "The name of the public subnet"
  type        = string
}

variable "private_subnet_name" {
  description = "The name of the private subnet"
  type        = string
}
