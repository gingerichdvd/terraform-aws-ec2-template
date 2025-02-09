variable "private_ip" {
  # The variables value is hidden in tfvars file
  description = "Personal ip address to enter vpc"
  type        = string
  sensitive   = true
}

variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "ExampleAppServerInstance"
}