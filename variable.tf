# Defines aws account id with value in terraform.tfvars file
variable "aws_account_id" {
  description = "AWS Account ID"
  type        = string
  sensitive   = true
}