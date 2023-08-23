resource "aws_iam_policy" "beacon_customer_bucket_read_write_policy" {
  name   = "beacon_customer_bucket_read_write_policy"
  policy = data.aws_iam_policy_document.beacon_customer_bucket_read_write_policy.json
}

data "aws_iam_policy_document" "beacon_customer_bucket_read_write_policy" {
  statement {
    effect = "Allow"
    actions = [
      "s3:DeleteObjectTagging",
      "s3:ListBucketByTags",
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
    resources = [
      "arn:aws:s3:::${var.account_id}-customer-submissions",
      "arn:aws:s3:::${var.account_id}-customer-submissions/*",
      "arn:aws:s3:::${var.account_id}-customer-submissions-dev",
      "arn:aws:s3:::${var.account_id}-customer-submissions-dev/*",
    ]
  }
  statement {
    sid    = "EncryptionPermission"
    effect = "Allow"
    actions = [
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:ReEncrypt*",
      "kms:GenerateDataKey*",
      "kms:DescribeKey",
    ]
    resources = [
      aws_kms_key.s3CustomerDataBucket.arn
    ]
  }
}
