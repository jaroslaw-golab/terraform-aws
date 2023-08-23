data "aws_caller_identity" "current" {}

resource "aws_cognito_user_pool" "customer-auth-pool" {
  name = "customer-auth-pool"

  auto_verified_attributes = [
    "phone_number",
  ]
  mfa_configuration          = "OPTIONAL"
  sms_authentication_message = <<-EOT
      Your verification code is {####}. 
  EOT
  tags                       = {}
  account_recovery_setting {
    recovery_mechanism {
      name     = "verified_email"
      priority = 1
    }
    recovery_mechanism {
      name     = "verified_phone_number"
      priority = 2
    }
  }
  sms_configuration {
    external_id    = "0003b253-25f7-497b-9f9f-2985a2c08991"
    sns_caller_arn = "arn:aws:iam::332278463693:role/service-role/customerauthpooldev-SMS-Role2"
  }

  schema {
    attribute_data_type      = "String"
    developer_only_attribute = false
    mutable                  = true
    name                     = "email"
    required                 = true

    string_attribute_constraints {
      max_length = "2048"
      min_length = "0"
    }
  }

  username_configuration {
    case_sensitive = false
  }
}

resource "aws_cognito_user_pool_client" "client" {
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
  user_pool_id                 = "us-east-1_LTwYgNZEl"
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

resource "aws_cognito_user_pool_client" "server" {
  user_pool_id          = aws_cognito_user_pool.customer-auth-pool.id
  name                  = "server-side-verify"
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







