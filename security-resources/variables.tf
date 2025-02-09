# Define ip address whose traffic will be allowed into the VPC
variable "private_ip" {
  # The variables value is hidden in tfvars file
  description = "Personal ip address to enter vpc"
  type        = string
  sensitive   = true
}

variable "vpc_id" {
  type = string
}