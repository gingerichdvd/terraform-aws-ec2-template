# Defines EC2 instance that will be run inside the VPC
resource "aws_instance" "app_server" {
  # AMI for Ubuntu linux server
  ami                    = "ami-00c257e12d6828491"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [var.security_group_id]
  subnet_id              = var.public_subnet_id

  root_block_device {
    volume_size = 10
  }

  tags = {
    Name = "ec2-server"
  }
}

# Link SSH key pair to connect to instances with SSH
resource "aws_key_pair" "ec2_auth" {
  key_name   = "ec2key"
  public_key = file("~/.ssh/ec2key.pub")
}
