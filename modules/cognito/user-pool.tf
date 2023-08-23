data "aws_caller_identity" "current" {}

locals {
  pools = [
    var.pool_sb,
    var.pool_training
  ]
}

resource "aws_cognito_user_pool" "customer-auth-pool" {
  for_each = toset(local.pools)
  name     = each.value

  auto_verified_attributes = [
    "phone_number",
  ]
  sms_configuration {

    external_id    = var.sns_external_id
    sns_caller_arn = var.sns_caller_arn
    sns_region     = "us-east-1"
  }


  mfa_configuration          = "OPTIONAL"
  sms_authentication_message = <<-EOT
    Your authentication code is {####}.
  EOT

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
}

resource "aws_cognito_user_pool_client" "client" {
  for_each = aws_cognito_user_pool.customer-auth-pool

  user_pool_id = each.value.id
  name         = var.app-client-config-name
  generate_secret     = true
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

  token_validity_units {
    access_token  = "minutes"
    id_token      = "minutes"
    refresh_token = "days"
  }
}
