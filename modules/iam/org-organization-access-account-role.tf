resource "aws_iam_role" "organization_account_access_role" {
  name = "org-OrganizationAccountAccessRole"
  assume_role_policy = data.aws_iam_policy_document.organization_account_access_role.json
  managed_policy_arns = [
    aws_iam_policy.organization_account_access_policy.arn
  ]
}
data "aws_iam_policy_document" "organization_account_access_role" {
  statement {
    sid     = ""
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::971702284436:root"]
    }
  }
}
resource "aws_iam_policy" "organization_account_access_policy" {
  name        = "OrganizationAccountAccessPolicy"
  description = "Policy for OrganizationAccountAccessRole"

  policy = data.aws_iam_policy_document.start_stop_lambda_policy.json

}

data "aws_iam_policy_document" "start_stop_lambda_policy" {
  statement {
    sid       = ""
    effect    = "Allow"
    resources = ["*"]

    actions = [
      "ec2:StopInstances",
      "ec2:StartInstances",
      "ec2:DescribeInstances",
      "rds:StopDBInstance",
      "rds:StartDBInstance",
      "rds:Describe*",
    ]
  }
}



resource "aws_iam_role_policy_attachment" "organization_account_access_attachment" {
  role       = aws_iam_role.organization_account_access_role.name
  policy_arn = aws_iam_policy.organization_account_access_policy.arn
}
