# Gives the instance id of a created EC2
output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.app_server.id
}

# Gives the public ip address of the EC2
output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.app_server.public_ip
}
