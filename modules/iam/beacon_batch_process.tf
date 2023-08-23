resource "aws_iam_role" "BeaconBatchProcess" {
  name               = "BeaconBatchProcess"
  assume_role_policy = data.aws_iam_policy_document.BeaconBatchProcessAssumePolicy.json

  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess",
    "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess",
    "arn:aws:iam::aws:policy/AWSBatchFullAccess",
    "arn:aws:iam::aws:policy/AmazonECS_FullAccess",
    "arn:aws:iam::aws:policy/service-role/AmazonDMSCloudWatchLogsRole",
    "arn:aws:iam::aws:policy/AmazonTextractFullAccess",
    "arn:aws:iam::aws:policy/AmazonSSMReadOnlyAccess",
    "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceRole",
    aws_iam_policy.beacon_customer_bucket_read_write_policy.arn
  ]
}

data "aws_iam_policy_document" "BeaconBatchProcessAssumePolicy" {
  statement {
    effect = "Allow"
    actions = [
      "sts:AssumeRole",
    ]
    principals {
      type = "Service"
      identifiers = [
        "ec2.amazonaws.com",
      ]
    }
  }
}



resource "aws_iam_instance_profile" "BeaconBatchProcess" {
  name = aws_iam_role.BeaconBatchProcess.name
  role = aws_iam_role.BeaconBatchProcess.name

}
