variable "environment" {
  description = "Environment name"
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
}

variable "public_subnet_1_cidr" {
  description = "Public subnet 1 CIDR"
  type        = string
}

variable "public_subnet_2_cidr" {
  description = "Public subnet 2 CIDR"
  type        = string
}

variable "private_subnet_1_cidr" {
  description = "Private subnet 1 CIDR"
  type        = string
}

variable "private_subnet_2_cidr" {
  description = "Private subnet 2 CIDR"
  type        = string
}

variable "az_1" {
  description = "Availability Zone 1"
  type        = string
}

variable "az_2" {
  description = "Availability Zone 2"
  type        = string
}


