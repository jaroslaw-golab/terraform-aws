output "account_id" {
  value = data.aws_caller_identity.current.account_id
}
output "client_secret_dev" {
  value     = aws_cognito_user_pool_client.server-dev.client_secret
  sensitive = true
}
