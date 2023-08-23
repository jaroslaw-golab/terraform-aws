data "aws_ssm_parameter" "vpc-id" {
  name = "/vpc/vpc-id"
}

module "awsBatchEventHandler" {

  source = "../../../modules/lambda/awsBatchEvent"

  function_name = "awsBatchEventHandler"
  runtime       = "nodejs16.x"
  filename      = "./file/lambda.zip"
  vpc_id        = data.aws_ssm_parameter.vpc-id.value

  type        = "zip"
  source_file = "./file/index.js"
  output_path = "./file/lambda.zip"

}
