resource "aws_iam_role" "awsbatchservice" {
  name               = "Beacon_aws_batch_service"
  assume_role_policy = data.aws_iam_policy_document.awsbatchservice.json

  managed_policy_arns = [
    "arn:aws:iam::aws:policy/service-role/AWSBatchServiceRole"
  ]

  tags = {
    "Name" = "Beacon_aws_batch_service"
  }

}


data "aws_iam_policy_document" "awsbatchservice" {
  statement {
    actions = [
      "sts:AssumeRole"
    ]
    principals {
      type = "Service"
      identifiers = [
        "batch.amazonaws.com"
      ]
    }
  }
}

resource "aws_iam_instance_profile" "awsbatchservice" {
  name = aws_iam_role.awsbatchservice.name
  role = aws_iam_role.awsbatchservice.name

}
