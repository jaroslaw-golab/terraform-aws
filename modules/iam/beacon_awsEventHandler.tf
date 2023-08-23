resource "aws_iam_role" "awsEventHandlerRole" {
  name               = "BeaconAwsEventHandler"
  assume_role_policy = data.aws_iam_policy_document.awsEventHandlerPolicy.json

  managed_policy_arns = [
    "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole",
    "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole",
    "arn:aws:iam::aws:policy/AmazonVPCFullAccess",
  ]
}

data "aws_iam_policy_document" "awsEventHandlerPolicy" {
  statement {
    effect = "Allow"

    principals {
      type = "Service"
      identifiers = [
        "lambda.amazonaws.com"
      ]
    }
    actions = [
      "sts:AssumeRole",
    ]
  }

}

resource "aws_iam_instance_profile" "awsEventHandlerRole" {
  name = aws_iam_role.awsEventHandlerRole.name
  role = aws_iam_role.awsEventHandlerRole.name

}
