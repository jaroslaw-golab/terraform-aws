resource "aws_iam_role" "beacon_backup_db_role" {
  name               = "BeaconBackupDbRole"
  path = "/"
  assume_role_policy = data.aws_iam_policy_document.beacon_backup_db_policy.json
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess",
    aws_iam_policy.beacon_copy_s3_models.arn,
  
  ]
  tags = {
    "Name" = "BeaconBackupDb"
  }
}
data "aws_iam_policy_document" "beacon_backup_db_policy" {
  statement {
    effect = "Allow"
    actions = [
      "sts:AssumeRole",
    ]
    principals {
      type = "Service"
      identifiers = [
        "ec2.amazonaws.com"
      ]
    }
  }
}
resource "aws_iam_policy" "beacon_copy_s3_models" {
  name   = "beacon_copy_s3_models"
  path   = "/"
  policy = data.aws_iam_policy_document.beacon_copy_s3_models.json
}

data "aws_iam_policy_document" "beacon_copy_s3_models" {
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
      "arn:aws:s3:::${var.account_id}-models-data",
      "arn:aws:s3:::${var.account_id}-models-data/*",
    ]
  }

}












resource "aws_iam_instance_profile" "beacon_backup_db_role" {
  name = aws_iam_role.beacon_backup_db_role.name
  role = aws_iam_role.beacon_backup_db_role.name

}

