data "aws_ssm_parameter" "vpc-id" {
  name = "/vpc/vpc-id"
}


module "batch" {
  source                   = "../../../modules/batch"
  vpc_id                   = data.aws_ssm_parameter.vpc-id.value
  compute_environment_name = "test-new"
}
