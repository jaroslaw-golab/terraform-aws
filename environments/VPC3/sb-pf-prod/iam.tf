resource "aws_iam_policy" "beacon__CustomerBucketReadWritePolicy" {
  description = null
  name        = "beacon__CustomerBucketReadWritePolicy"
  name_prefix = null
  path        = "/"
  policy      = data.aws_iam_policy_document.beacon__CustomerBucketReadWritePolicy.json
  tags        = {}
  tags_all    = {}
}

data "aws_iam_policy_document" "beacon__CustomerBucketReadWritePolicy" {
  statement {
    sid    = "RWAccessToS3"
    effect = "Allow"

    resources = [
      "arn:aws:s3:::${data.aws_caller_identity.current.id}-customer-submissions",
      "arn:aws:s3:::${data.aws_caller_identity.current.id}-customer-submissions/*",
      "arn:aws:s3:::${data.aws_caller_identity.current.id}-customer-submissions-dev",
      "arn:aws:s3:::${data.aws_caller_identity.current.id}-customer-submissions-dev/*",
      "arn:aws:s3:::${data.aws_caller_identity.current.id}-customer-submissions-test",
      "arn:aws:s3:::${data.aws_caller_identity.current.id}-customer-submissions-test/*",
      "arn:aws:s3:::${data.aws_caller_identity.current.id}-customer-submissions-sb",
      "arn:aws:s3:::${data.aws_caller_identity.current.id}-customer-submissions-sb/*",
      "arn:aws:s3:::${data.aws_caller_identity.current.id}-customer-submissions-training",
      "arn:aws:s3:::${data.aws_caller_identity.current.id}-customer-submissions-training/*",
    ]

    actions = [
      "s3:DeleteObjectTagging",
      "s3:ListBucketMultipartUploads",
      "s3:DeleteObjectVersion",
      "s3:GetObjectVersionTagging",
      "s3:ListBucketVersions",
      "s3:PutObjectVersionTagging",
      "s3:ListBucket",
      "s3:DeleteObjectVersionTagging",
      "s3:ListMultipartUploadParts",
      "s3:PutObject",
      "s3:GetObject",
      "s3:AbortMultipartUpload",
      "s3:GetObjectTagging",
      "s3:PutObjectTagging",
      "s3:DeleteObject",
      "s3:GetObjectVersion",
    ]
  }

  statement {
    sid       = "EncryptionPermission"
    effect    = "Allow"
    resources = ["arn:aws:kms:us-east-1:931929721969:key/858ffdbe-bbe3-4755-9bea-68c78b67e55e"]

    actions = [
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:ReEncrypt*",
      "kms:GenerateDataKey*",
      "kms:DescribeKey",
    ]
  }
}

resource "aws_s3_bucket_policy" "models-data" {
  provider = aws.vpc2
  bucket   = "971702284436-models-data"
  policy   = data.aws_iam_policy_document.models-data.json
}

data "aws_iam_policy_document" "models-data" {
  statement {
    sid    = ""
    effect = "Deny"

    resources = [
      "arn:aws:s3:::971702284436-models-data",
      "arn:aws:s3:::971702284436-models-data/*",
    ]

    actions = [
      "s3:PutObject",
      "s3:PutObjectTagging",
    ]

    condition {
      test     = "StringNotLike"
      variable = "aws:userId"

      values = [
        "AROAIAFYEGLPA3XTZOQJA:*",
        "AIDAJPHJQUDYG4ZCESSR6",
        "AIDA6EPPYGCKOJYTI6HPT",
      ]
    }

    principals {
      type        = "*"
      identifiers = ["*"]
    }
  }

  statement {
    sid    = "DelegateS3Access - Demo / stg"
    effect = "Allow"

    resources = [
      "arn:aws:s3:::971702284436-models-data/*",
      "arn:aws:s3:::971702284436-models-data",
    ]

    actions = [
      "s3:ListBucket",
      "s3:GetObject",
    ]

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::766567055321:root"]
    }
  }

  statement {
    sid    = "DelegateS3Access - Pf - Production"
    effect = "Allow"

    resources = [
      "arn:aws:s3:::971702284436-models-data/*",
      "arn:aws:s3:::971702284436-models-data",
    ]

    actions = [
      "s3:ListBucket",
      "s3:GetObject",
    ]

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::931929721969:root"]
    }
  }

  statement {
    sid    = "DelegateS3Access - Instem"
    effect = "Allow"

    resources = [
      "arn:aws:s3:::971702284436-models-data/*",
      "arn:aws:s3:::971702284436-models-data",
    ]

    actions = [
      "s3:ListBucket",
      "s3:GetObject",
    ]

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::300036881409:root"]
    }
  }

  statement {
    sid    = "DelegateS3Access - CSL"
    effect = "Allow"

    resources = [
      "arn:aws:s3:::971702284436-models-data/*",
      "arn:aws:s3:::971702284436-models-data",
    ]

    actions = [
      "s3:ListBucket",
      "s3:GetObject",
    ]

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::332278463693:root"]
    }
  }

  statement {
    sid    = "DelegateS3Access - Pf SB Training"
    effect = "Allow"

    resources = [
      "arn:aws:s3:::971702284436-models-data/*",
      "arn:aws:s3:::971702284436-models-data",
    ]

    actions = [
      "s3:ListBucket",
      "s3:GetObject",
    ]

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::759180416712:root"]
    }
  }

  statement {
    sid    = "DelegateS3Access - ONO"
    effect = "Allow"

    resources = [
      "arn:aws:s3:::971702284436-models-data/*",
      "arn:aws:s3:::971702284436-models-data",
    ]

    actions = [
      "s3:ListBucket",
      "s3:GetObject",
    ]

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::789543349485:root"]
    }
  }

  statement {
    sid    = "DelegateS3Access - ICON"
    effect = "Allow"

    resources = [
      "arn:aws:s3:::971702284436-models-data/*",
      "arn:aws:s3:::971702284436-models-data",
    ]

    actions = [
      "s3:ListBucket",
      "s3:GetObject",
    ]

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::885794559755:root"]
    }
  }

  statement {
    sid    = "DelegateS3Access - Syneos"
    effect = "Allow"

    resources = [
      "arn:aws:s3:::971702284436-models-data/*",
      "arn:aws:s3:::971702284436-models-data",
    ]

    actions = [
      "s3:ListBucket",
      "s3:GetObject",
    ]

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::283519708233:root"]
    }
  }

  statement {
    sid    = "DelegateS3Access - AWS_CLI"
    effect = "Allow"

    resources = [
      "arn:aws:s3:::971702284436-models-data/*",
      "arn:aws:s3:::971702284436-models-data",
    ]

    actions = [
      "s3:ListBucket",
      "s3:GetObject",
      "s3:PutObject",
      "s3:PutObjectTagging",
    ]

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::971702284436:user/aws_cli"]
    }
  }

  statement {
    sid    = "DelegateS3Access - Learn Environment"
    effect = "Allow"

    resources = [
      "arn:aws:s3:::971702284436-models-data/*",
      "arn:aws:s3:::971702284436-models-data",
    ]

    actions = [
      "s3:ListBucket",
      "s3:GetObject",
    ]

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::661341420438:root"]
    }
  }
}