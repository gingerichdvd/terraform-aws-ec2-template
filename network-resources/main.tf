# Creates a Virtual Private Cloud to host ec2 instances
resource "aws_vpc" "default" {
  cidr_block           = "172.30.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "default_vpc"
  }
}

# Defines subnet of private ip addresses for the VPC
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.default.id
  cidr_block              = "172.30.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-west-2a"

  tags = {
    Name = "default_public"
  }
}

# Creates a gateway for traffic to flow in and out of the VPC to the internet
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.default.id

  tags = {
    Name = "default_igw"
  }
}

# Creates a routing table for the VPC
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.default.id

  tags = {
    Name = "public_rt"
  }
}

# Defines a defalut route for instances inside the VPC to send traffic to the internet
resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.internet_gateway.id
}

# Defines associations in the routing table
resource "aws_route_table_association" "route_assoc" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}