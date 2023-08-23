locals {
  repos = [

    var.repo_sb,
    var.repo_training
  ]
}
resource "aws_ecr_repository" "ecr_repository" {
  for_each = toset(local.repos)
  name     = each.value
  image_scanning_configuration {
    scan_on_push = false
  }
}
