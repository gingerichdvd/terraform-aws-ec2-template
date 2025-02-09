variable "private_ip" {
  # The variables value is hidden in tfvars file
  description = "Personal ip address to enter vpc"
  type        = string
  sensitive   = true
}