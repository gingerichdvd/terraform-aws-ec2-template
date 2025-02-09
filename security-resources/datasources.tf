# Gets my ip address tht is stored in the AWS SSM Parameter Store
data "aws_secretsmanager_secret_version" "public_ip" {
  secret_id = "my_public_ip_secret_id"
}