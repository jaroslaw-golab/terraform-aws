data "aws_caller_identity" "current" {}

data "aws_ssm_parameter" "BatchSecurityGroupID" {
  name = "/vpc/sg/BatchSecurityGroupID"
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


resource "aws_batch_compute_environment" "default" {
  compute_environment_name = var.compute_environment_name

  compute_resources {
    instance_role = "arn:aws:iam::035051297320:instance-profile/BeaconBatchProcess"

    instance_type = [
      "optimal",
    ]

    max_vcpus = 40
    min_vcpus = 0

    security_group_ids = [
      data.aws_ssm_parameter.BatchSecurityGroupID.value,
    ]

    subnets = data.aws_subnets.private.ids

    type = "EC2"
  }

  service_role = "arn:aws:iam::035051297320:role/aws-service-role/batch.amazonaws.com/AWSServiceRoleForBatch"
  type         = "MANAGED"
  #depends_on   = [aws_iam_role_policy_attachment.aws_batch_service_role]
}
