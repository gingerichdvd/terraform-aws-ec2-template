# Defines EC2 instance that will be run inside the VPC
resource "aws_instance" "app_server" {
  # AMI for Ubuntu linux server
  ami                    = "ami-00c257e12d6828491"
  instance_type          = "t2.micro"
  # Sets resource values to other module resource's ids
  vpc_security_group_ids = [var.security_group_id]
  subnet_id              = var.public_subnet_id

  # Ensure this line is here, needed to connect to ec2 instance with ssh
  key_name               = aws_key_pair.ec2_auth.key_name

  # Get bash script to install docker onto the ec2 instance
  user_data = file("userdata.sh")

  root_block_device {
    volume_size = 10
  }

  tags = {
    Name = "ec2-server"
  }
}

# Link SSH key pair to connect to instances with SSH
resource "aws_key_pair" "ec2_auth" {
  key_name   = "ec2_key"
  public_key = file("~/.ssh/ec2_key.pub")
}
