# Variables are given values through main.tf file in parent directory
variable "vpc_id" {
  type = string
}

variable "security_group_id" {
  type = string
}

variable "public_subnet_id" {
  type = string
}