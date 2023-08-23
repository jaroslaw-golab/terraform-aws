data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "iam_for_lambda" {
  name               = "${var.customer}-start-stop-lambda-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
  
  managed_policy_arns = [
    aws_iam_policy.default.arn,
    aws_iam_policy.start_stop_lambda_policy.arn,
    aws_iam_policy.organization-access.arn,
    "arn:aws:iam::aws:policy/IAMFullAccess"
  ]
}

resource "aws_iam_policy" "start_stop_lambda_policy" {
  name        = "${var.customer}-start-stop-lambda-policy"
  description = "Policy for my start/stop lambda function"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ec2:StopInstances",
        "ec2:StartInstances",
        "ec2:DescribeInstances",
        "rds:StopDBInstance",
        "rds:StartDBInstance",
        "rds:Describe*"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "lambda_policy_attachment" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = aws_iam_policy.start_stop_lambda_policy.arn
}
resource "aws_iam_policy" "default" {
  name        = "AWSLambdaBasicExecutionRole"
  description = "AWSLambdaBasicExecutionRole"

  policy = data.aws_iam_policy_document.default.json
}

data "aws_iam_policy_document" "default" {
  version = "2012-10-17"

  statement {
    effect = "Allow"
    actions = [
      "logs:CreateLogGroup"
    ]
    resources = [
      "arn:aws:logs:us-east-1:971702284436:*"
    ]
  }

  statement {
    effect = "Allow"
    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]
    resources = [
      "arn:aws:logs:us-east-1:971702284436:log-group:/aws/lambda/org-start-stop-resources-lambda:*"
    ]
  }
}



resource "aws_iam_policy" "organization-access" {
  name   = "org-organization-access-policy"
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "organizations:*",
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "account:GetContactInformation",
                "account:PutContactInformation",
                "account:ListRegions",
                "account:EnableRegion",
                "account:DisableRegion"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": "iam:CreateServiceLinkedRole",
            "Resource": "*",
            "Condition": {
                "StringEquals": {
                    "iam:AWSServiceName": "organizations.amazonaws.com"
                }
            }
        }
    ]
}
EOF
}

# resource "aws_iam_policy_attachment" "organization-access-attachment" {
#   name       = "org-organization-access-policy-attachment"
#   roles      = [aws_iam_role.aws_iam_policy.organization-access-role.arn]
#   policy_arn = aws_iam_policy.organization-access-role.arn
# }

resource "aws_iam_role" "organization-access-role" {
  name               = "org-organization-access-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "organizations.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_organizations_organization" "organization" {
  feature_set = "ALL"
}


