data "aws_ssm_parameter" "awsEventHandlerRole" {
  name = "/iam/awsBatchEvent-arn"
}

data "aws_subnets" "private" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }

  tags = {
    Stage = "private"
  }
}

data "aws_ssm_parameter" "batch_security_group" {
  name = "/vpc/sg/BatchSecurityGroupID"
}

resource "aws_lambda_function" "default" {

  function_name = var.function_name
  role          = data.aws_ssm_parameter.awsEventHandlerRole.value
  handler       = "index.lambda_handler"
  runtime       = var.runtime
  filename      = var.filename
  timeout       = 300
  #source_code_hash = var.filehash
  vpc_config {
    subnet_ids         = data.aws_subnets.private.ids
    security_group_ids = [data.aws_ssm_parameter.batch_security_group.value]
  }
}

data "archive_file" "lambda" {
  type        = var.type
  source_file = var.source_file
  output_path = var.output_path
}

