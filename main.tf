# Cal child module to create a VPC and network
module "network-resources" {
  source = "./network-resources"
  vpc_id = module.network-resources.vpc_id
}

# Calls child module to create ACLs
module "security-resources" {
  source         = "./security-resources"
  vpc_id         = module.network-resources.vpc_id
  aws_account_id = var.aws_account_id
}

# Call child module to create ec2 instance, gives values from other modules
module "ec2-resources" {
  source            = "./ec2-resources"
  vpc_id            = module.network-resources.vpc_id
  security_group_id = module.security-resources.security_group_id
  public_subnet_id  = module.network-resources.public_subnet_id
}