# Gets my ip address tht is stored in the AWS SSM Parameter Store
data "aws_ssm_parameter" "my_public_ip" {
  name = "my_public_ip"
   with_decryption = true
}