resource "aws_iam_role" "BeaconDockerBuilder" {
  name               = "BeaconDockerBuilder"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.BeaconDockerBuilderAssumeRole.json

  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess",
    aws_iam_policy.beaconCopyS3automationResources.arn,
    aws_iam_policy.beacon_copy_s3_models.arn
  ]
}

data "aws_iam_policy_document" "BeaconDockerBuilderAssumeRole" {
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

resource "aws_iam_instance_profile" "BeaconDockerBuilder" {
  name = aws_iam_role.BeaconDockerBuilder.name
  role = aws_iam_role.BeaconDockerBuilder.name
}
