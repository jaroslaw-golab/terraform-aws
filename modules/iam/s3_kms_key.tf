data "aws_caller_identity" "current" {}

resource "aws_kms_key" "s3CustomerDataBucket" {
  policy = data.aws_iam_policy_document.s3CustomerDataBucket.json
}

data "aws_iam_policy_document" "s3CustomerDataBucket" {
  statement {
    actions = [
      "kms:*",
    ]
    principals {
      type = "AWS"
      identifiers = [
        "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
      ]
    }

    resources = [
      "*"
    ]

  }
}

output "kms_key" {
  value = aws_kms_key.s3CustomerDataBucket.arn
}
