output "beacon_app_server_role" {
  value = aws_iam_role.beacon_app_server_role.arn
}
output "beacon_customer_bucket_read_write_policy" {
  value = aws_iam_policy.beacon_customer_bucket_read_write_policy.arn
}

output "cognito_sms_role" {
  value = aws_iam_role.BeaconSMS
}
resource "aws_ssm_parameter" "beacon_sms_arn" {
  name  = "/iam/beacon_sms_arn"
  type  = "String"
  value = aws_iam_role.BeaconSMS.arn

}
resource "aws_ssm_parameter" "awsBatchEvent" {
  type  = "String"
  name  = "/iam/awsBatchEvent-arn"
  value = aws_iam_role.awsEventHandlerRole.arn

}
