This project is to learn the basics of terraform and how to use it to create resources on Amazon Web Services. The current build lacks advance features and security
as it's primary purpose is learn the basics and be used by individuals. Future iterations will be expanded to include more advance feature.

Template to create Virtual Private cloud, network, security group with ACLs, and EC2 (cloud virtual machines) on Amazon Web Service (AWS). 
Resources are separated into modules based on what they create. VPC and network resources are stored in the network-resources module, security policies 
to create access control lists are stored in the security-resources module, and EC2 resources are stored in the ec2-resources module.

The current design has a security policy to let only SSH traffic from the user's public ip address. The security resource module contains a iam.tf file which uses the user's
aws account id to retrieve their stored ip. The user can store their aws account id in a .tfvars file or an environment file stored on their local machine. 

The template also has a bash script which installs docker when the ec2 instance is created. This project currently creates a Ubuntu EC2 instance, so if the user wishes to 
use a different OS, this .sh script needs to be changed. 
