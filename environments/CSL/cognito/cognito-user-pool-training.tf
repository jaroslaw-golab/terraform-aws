resource "aws_cognito_user_pool" "customer-auth-pool-training" {
  name = "customer-auth-pool-training"

  auto_verified_attributes = [
    "phone_number",
    "email",
  ]
  mfa_configuration          = "OPTIONAL"
  sms_authentication_message = <<-EOT
      Your verification code is {####}. 
  EOT
  tags                       = {}
  account_recovery_setting {
    recovery_mechanism {
      name     = "verified_email"
      priority = 2
    }
    recovery_mechanism {
      name     = "verified_phone_number"
      priority = 1
    }
  }
  sms_configuration {
    external_id    = "9136fe53-c29c-4004-b855-3b3a4f406109"
    sns_caller_arn = "arn:aws:iam::332278463693:role/service-role/customerauthpool-SMS-Role"
  }
  user_attribute_update_settings {
    attributes_require_verification_before_update = [
      "email",
    ]
  }
  username_attributes = [
    "email",
  ]
  username_configuration {
    case_sensitive = false
  }
  email_configuration {
    email_sending_account = "COGNITO_DEFAULT"
  }


}


resource "aws_cognito_user_pool_client" "training" {
  name         = "Verify"
  user_pool_id = aws_cognito_user_pool.customer-auth-pool-training.id

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


resource "aws_cognito_user_pool_client" "server-training" {
  user_pool_id          = aws_cognito_user_pool.customer-auth-pool-training.id
  name                  = "server-side-verify-training"
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
