locals {
  run_parsing_jobs = [
    {
      name              = "RunParsingJobDef"
      job_definition    = "run-parsing-job-def"
      image             = "${aws_iam_role.ACCOUNT_ID}.dkr.ecr.us-east-1.amazonaws.com/table-files-processing"
      environment_vars  = [
        {
          name  = "USE_TXT_FOR_PDF"
          value = "true"
        }
      ]
      resource_memory   = "8000"
      resource_vcpu     = "2"
    },
    {
      name              = "RunParsingJobDefDev"
      job_definition    = "run-parsing-job-def-dev"
      image             = "${aws_iam_role.ACCOUNT_ID}.dkr.ecr.us-east-1.amazonaws.com/table-files-processing-dev"
      environment_vars  = [
        {
          name  = "USE_TXT_FOR_PDF"
          value = "true"
        }
      ]
      resource_memory   = "8000"
      resource_vcpu     = "2"
    },
    {
      name              = "RunParsingJobDefTest"
      job_definition    = "run-parsing-job-def-test"
      image             = "${aws_iam_role.ACCOUNT_ID}.dkr.ecr.us-east-1.amazonaws.com/table-files-processing-test"
      environment_vars  = [
        {
          name  = "USE_TXT_FOR_PDF"
          value = "true"
        }
      ]
      resource_memory   = "8000"
      resource_vcpu     = "2"
    }
  ]

  post_parsing_jobs = [
    {
      name              = "PostParsingJobDef"
      job_definition    = "post-parsing-def"
      image             = "${aws_iam_role.ACCOUNT_ID}.dkr.ecr.us-east-1.amazonaws.com/table-files-processing"
      environment_vars  = [
        {
          name  = "POST_PARSING"
          value = "true"
        }
      ]
      resource_memory   = "16000"
      resource_vcpu     = "4"
    },
    {
      name              = "PostParsingJobDefDev"
      job_definition    = "post-parsing-def-dev"
      image             = "${aws_iam_role.ACCOUNT_ID}.dkr.ecr.us-east-1.amazonaws.com/table-files-processing-dev"
      environment_vars  = [
        {
          name  = "POST_PARSING"
          value = "true"
        }
      ]
      resource_memory   = "16000"
      resource_vcpu     = "4"
    },
    {
      name              = "PostParsingJobDefTest"
      job_definition    = "post-parsing-def-test"
      image             = "${aws_iam_role.ACCOUNT_ID}.dkr.ecr.us-east-1.amazonaws.com/table-files-processing-test"
      environment_vars  = [
        {
          name  = "POST_PARSING"
          value = "true"
        }
      ]
      resource_memory   = "16000"
      resource_vcpu     = "4"
    }
  ]
}

resource "aws_batch_job_definition" "run_parsing_jobs" {
  count = length(local.run_parsing_jobs)

  type = "container"
  name = local.run_parsing_jobs[count.index].job_definition

  container_properties {
    image = local.run_parsing_jobs[count.index].image

    environment {
      name  = local.run_parsing_jobs[count
