# Defines EC2 instance that will be run inside the VPC
resource "aws_instance" "app_server" {
  # AMI for Red Hat linux server
  ami           = "ami-0da4b082c0455e0a0"
  instance_type = "t2.micro"
  vpc_security_group_ids = [var.security_group_id]
  subnet_id = var.public_subnet_id

  tags = {
    Name = "ec2-server"
  }
}

# Link SSH key pair to connect to instances with SSH
resource "aws_key_pair" "ec2_auth" {
  key_name   = "ec2key"
  public_key = file("~/.ssh/ec2key.pub")
}
