/* This data block is to connect to ec2 instances already running on AWS. This doesn't create ec2 
instances, an "aws_ami_from instance" resource block and associated variable block create 
ec2 instances. To use this data block to connect to existing ec2 instance created in the 
AWS console, comment the "aws_ami_from_instance" resource block and associated variable, 
then uncomment the data block. Add apropriate owvers and values.
*/
/*
data "aws_ami" "server_ami" {
  most_recent = true
  owners      = []

  filter {
    name   = "name"
    values = []
  }
}
*/