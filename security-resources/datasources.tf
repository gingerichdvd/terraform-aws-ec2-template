# Gets ip address stored inside AWS System Management console
data "aws_ssm_parameter" "my_public_ip" {
  name            = "my_public_ip"
  with_decryption = true
}