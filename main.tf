# Creates a Virtual Private Cloud to host ec2 instances
resource "aws_vpc" "mtc_vpc" {
  cidr_block           = "10.10.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "dev"
  }
}

# Defines subnet of private ip addresses for the VPC
resource "aws_subnet" "mtc_public_subnet" {
  vpc_id                  = aws_vpc.mtc_vpc.id
  cidr_block              = "10.10.0.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-west-2a"

  tags = {
    Name = "dev-public"
  }
}

# Creates a gateway for traffic to flow in and out of the VPC to the internet
resource "aws_internet_gateway" "mtc_internet_gateway" {
  vpc_id = aws_vpc.mtc_vpc.id

  tags = {
    Name = "dev-igw"
  }
}

# Creates a routing table for the VPC
resource "aws_route_table" "mtc_public_rt" {
  vpc_id = aws_vpc.mtc_vpc.id

  tags = {
    Name = "dev-public-rt"
  }
}

# Defines a defalut route for instances inside the VPC to send traffic to the internet
resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.mtc_public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.mtc_internet_gateway.id
}

# Defines associations in the routing table
resource "aws_route_table_association" "mtc_route_assoc" {
  subnet_id      = aws_subnet.mtc_public_subnet.id
  route_table_id = aws_route_table.mtc_public_rt.id
}

# Defines ACL allowing what traffic enters and leaves the VPC
resource "aws_security_group" "mtc_sg" {
  #Security group has a name attribute, doesn't need to be tagged
  name        = "dev-sg"
  description = "dev security group"
  vpc_id      = aws_vpc.mtc_vpc.id

  # Allows all traffic from a given ip address, blocks trafffic from all other ip addresses
  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
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

# Defines EC2 instance that will be run inside the VPC
resource "aws_instance" "app_server" {
  # AMI for Red Hat linux server
  ami           = "ami-0da4b082c0455e0a0"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}

# Link SSH key pair to connect to instances with SSH
resource "aws_key_pair" "mtc_auth" {
  key_name   = "mtckey"
  public_key = file("~/.ssh/mtckey.pub")
}
