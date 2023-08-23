module "ecr_repository" {
  source = "../../../modules/ecr"

  repo_prod = "table-files-processing"

  repo_dev = "table-files-processing-dev"

  repo_test = "table-files-processing-test"

  repo_sb = "table-files-processing-sb"
}
