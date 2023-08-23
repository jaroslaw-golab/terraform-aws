resource "aws_iam_role" "beacon_app_server_role" {
  name = "beacon_app_server_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    "Name" = "${var.iam_role_name}"
  }
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonSESFullAccess",
    "arn:aws:iam::aws:policy/AWSBatchFullAccess",
    "arn:aws:iam::aws:policy/AmazonCognitoPowerUser",
    "arn:aws:iam::aws:policy/AmazonSSMReadOnlyAccess",
    "arn:aws:iam::${data.aws_caller_identity.current.id}:policy/beacon_customer_bucket_read_write_policy",
  ]
  depends_on = [
    aws_iam_policy.beacon_customer_bucket_read_write_policy
  ]
}


resource "aws_iam_instance_profile" "beacon_app_server_role" {
  name = aws_iam_role.beacon_app_server_role.name
  role = aws_iam_role.beacon_app_server_role.name


}
