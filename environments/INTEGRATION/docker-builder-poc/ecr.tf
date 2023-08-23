module "ecr_repository" {
  source = "../../../modules/ecr"

  repo_training = "table-files-processing-training"

  repo_sb = "table-files-processing-sb"
}