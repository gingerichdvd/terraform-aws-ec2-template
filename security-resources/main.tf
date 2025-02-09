# Defines ACL allowing what traffic enters and leaves the VPC
resource "aws_security_group" "sg" {
  #Security group has a name attribute, doesn't need to be tagged
  name        = "default_sg"
  description = "default security group"
  vpc_id      = var.vpc_id

  # Allows only SSH traffic from private ip address
  ingress {
    from_port = "22"
    to_port   = "22"
    protocol  = "tcp"
    # Calls senstive variable allowing only my personal ip address to enter the vpc 
    cidr_blocks = [var.private_ip]
  }

  # Allows all traffic to leave the VPC and access the internet
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
