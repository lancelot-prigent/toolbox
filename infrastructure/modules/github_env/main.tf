resource "github_repository_environment" "this" {
  environment = var.env_name
  repository  = var.gh_repo_name
}
