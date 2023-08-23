resource "aws_cognito_user_pool" "customer-auth-pool-dev" {
  name = "customer-auth-pool-dev"

  auto_verified_attributes = [
    "phone_number",
  ]
  mfa_configuration          = "OPTIONAL"
  sms_authentication_message = <<-EOT
      Your verification code is {####}. 
  EOT
  tags                       = {}

  sms_configuration {
    external_id    = "920efbfb-8d86-4d32-a7cf-f8f444e9c734"
    sns_caller_arn = "arn:aws:iam::789543349485:role/BeaconSMS"
  }
  email_configuration {
    email_sending_account = "DEVELOPER"
    source_arn            = "arn:aws:ses:us-east-1:789543349485:identity/beaconcure.com"
  }

  username_attributes = [
    "email",
    "phone_number",
  ]
}



resource "aws_cognito_user_pool_client" "dev" {
  access_token_validity                         = 60
  allowed_oauth_flows                           = []
  allowed_oauth_flows_user_pool_client          = false
  allowed_oauth_scopes                          = []
  auth_session_validity                         = 3
  callback_urls                                 = []
  enable_propagate_additional_user_context_data = false
  enable_token_revocation                       = true
  explicit_auth_flows = [
    "ALLOW_CUSTOM_AUTH",
    "ALLOW_REFRESH_TOKEN_AUTH",
    "ALLOW_USER_SRP_AUTH",
  ]
  id_token_validity             = 60
  logout_urls                   = []
  name                          = "Verify"
  prevent_user_existence_errors = "ENABLED"
  read_attributes = [
    "address",
    "birthdate",
    "email",
    "email_verified",
    "family_name",
    "gender",
    "given_name",
    "locale",
    "middle_name",
    "name",
    "nickname",
    "phone_number",
    "phone_number_verified",
    "picture",
    "preferred_username",
    "profile",
    "updated_at",
    "website",
    "zoneinfo",
  ]
  refresh_token_validity       = 30
  supported_identity_providers = []
  user_pool_id                 = aws_cognito_user_pool.customer-auth-pool-dev.id
  write_attributes = [
    "address",
    "birthdate",
    "email",
    "family_name",
    "gender",
    "given_name",
    "locale",
    "middle_name",
    "name",
    "nickname",
    "phone_number",
    "picture",
    "preferred_username",
    "profile",
    "updated_at",
    "website",
    "zoneinfo",
  ]

  token_validity_units {
    access_token  = "minutes"
    id_token      = "minutes"
    refresh_token = "days"
  }
}

resource "aws_cognito_user_pool_client" "server-dev" {
  user_pool_id          = aws_cognito_user_pool.customer-auth-pool-dev.id
  name                  = "server-side-verify-dev"
  generate_secret       = true
  access_token_validity = 60
  explicit_auth_flows = [
    "ALLOW_ADMIN_USER_PASSWORD_AUTH",
    "ALLOW_REFRESH_TOKEN_AUTH",
  ]
  id_token_validity = 60

  read_attributes = [
    "address",
    "birthdate",
    "email",
    "email_verified",
    "family_name",
    "gender",
    "given_name",
    "locale",
    "middle_name",
    "name",
    "nickname",
    "phone_number",
    "phone_number_verified",
    "picture",
    "preferred_username",
    "profile",
    "updated_at",
    "website",
    "zoneinfo",
  ]
  write_attributes = [
    "address",
    "birthdate",
    "email",
    "family_name",
    "gender",
    "given_name",
    "locale",
    "middle_name",
    "name",
    "nickname",
    "phone_number",
    "picture",
    "preferred_username",
    "profile",
    "updated_at",
    "website",
    "zoneinfo",
  ]
  # (13 unchanged attributes hidden)

  token_validity_units {
    access_token  = "minutes"
    id_token      = "minutes"
    refresh_token = "days"
  }
}






