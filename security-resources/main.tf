# Defines ACL allowing what traffic enters and leaves the VPC
resource "aws_security_group" "sg" {
  #Security group has a name attribute, doesn't need to be tagged
  name        = "default_sg"
  description = "default security group"
  vpc_id      = var.vpc_id

  # Allows only tcp traffic from personal ip address
  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "tcp"
    # Sets the only ip address that can access the ec2 instance inside the VPC is the private ip address stored in the AWS SSM
    cidr_blocks = ["${data.aws_ssm_parameter.my_public_ip.value}/32"]
  }

  # Allows all traffic to leave the VPC and access the internet
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
