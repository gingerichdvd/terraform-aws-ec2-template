# Define ip address whose traffic will be allowed into the VPC
variable "private_ip" {
  # The variables value is hidden in tfvars file
  description = "Personal ip address to enter vpc"
  type        = string
  sensitive   = true
}

# Defines name of each ec2 instanc created
variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "ExampleAppServerInstance"
}