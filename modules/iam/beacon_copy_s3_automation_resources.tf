resource "aws_iam_policy" "beaconCopyS3automationResources" {
  name   = "beaconCopyS3automationResources"
  policy = data.aws_iam_policy_document.beaconCopyS3automationResources.json
}

data "aws_iam_policy_document" "beaconCopyS3automationResources" {
  statement {
    effect = "Allow"
    actions = [
      "s3:Get*",
      "s3:List*"
    ]
    resources = [
      "arn:aws:s3:::971702284436-automation-resources",
      "arn:aws:s3:::971702284436-automation-resources/*",
      "arn:aws:s3:::971702284436-models-data/",
      "arn:aws:s3:::971702284436-models-data/*",

    ]
  }
}
