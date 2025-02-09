# Access the AWS SSM to get stored ip address
resource "aws_iam_policy" "my_secret_policy" {
  name        = "my_secret_policy"
  description = "Allow access to Secrets Manager for my_public_ip"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "secretsmanager:GetSecretValue"
        Resource = "arn:aws:secretsmanager:us-west-2:${var.aws_account_id}:secret:my_public_ip-*"
      }
    ]
  })
}
