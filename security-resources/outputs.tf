output "security_group_id" {
  value = aws_security_group.sg.id
}

output "my_ip" {
  value = data.aws_ssm_parameter.my_public_ip.value
}
