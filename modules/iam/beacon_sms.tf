resource "aws_iam_role" "BeaconSMS" {
  name               = "BeaconSMSRole"
  assume_role_policy = data.aws_iam_policy_document.BeaconSMSAssumeRole.json
}
data "aws_iam_policy_document" "BeaconSMSAssumeRole" {
  statement {
    effect = "Allow"
    actions = [
      "sts:AssumeRole",
    ]
    principals {
      type = "Service"
      identifiers = [
        "cognito-idp.amazonaws.com",
      ]
    }
    condition {
      test     = "StringEquals"
      variable = "sts:ExternalId"
      values   = ["920efbfb-8d86-4d32-a7cf-f8f444e9c734"]
    }
  }
}




resource "aws_iam_policy" "beacon_sms_policy" {
  name   = "beacon_sms_policy"
  path   = "/"
  policy = data.aws_iam_policy_document.beacon_sms.json
}
data "aws_iam_policy_document" "beacon_sms" {
  statement {
    effect = "Allow"
    actions = [
      "sns:publish",
    ]
    resources = ["*"]

  }

}

resource "aws_iam_role_policy_attachment" "BeaconSMS" {
  role       = aws_iam_role.BeaconSMS.name
  policy_arn = aws_iam_policy.beacon_sms_policy.arn
}

resource "aws_iam_role_policy_attachment" "beacon_sms_policy" {
  role       = aws_iam_role.BeaconSMS.name
  policy_arn = aws_iam_policy.beacon_sms_policy.arn
}

resource "aws_iam_instance_profile" "BeaconSMS" {
  name = aws_iam_role.BeaconSMS.name
  role = aws_iam_role.BeaconSMS.name

}
