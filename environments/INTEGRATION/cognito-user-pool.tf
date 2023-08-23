data "aws_caller_identity" "current" {}

resource "aws_cognito_user_pool" "customer-auth-pool-dev" {
  name = "customer-auth-pool-dev"

  auto_verified_attributes = [
    "phone_number",
  ]
  mfa_configuration          = "OPTIONAL"
  sms_authentication_message = <<-EOT
            Your authentication code is {####}.
        EOT      
  sms_configuration {
    external_id    = "920efbfb-8d86-4d32-a7cf-f8f444e9c734"
    sns_caller_arn = "arn:aws:iam::035051297320:role/BeaconSMSRole"
  }
  email_configuration {
    email_sending_account = "DEVELOPER"
    source_arn            = "arn:aws:ses:us-east-1:035051297320:identity/verifyemails@beaconcure.com"
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

  software_token_mfa_configuration {
    enabled = true
  }

  username_configuration {
    case_sensitive = false
  }

  # (4 unchanged blocks hidden)
}
resource "aws_cognito_user_pool_client" "client" {
  user_pool_id = aws_cognito_user_pool.customer-auth-pool-dev.id
  name         = "server-side-verify-dev"

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
