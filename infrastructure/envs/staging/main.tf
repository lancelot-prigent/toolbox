module "environment" {
  source = "../../modules/environment"

  env_name     = "staging"
  gh_repo_name = var.gh_repo_name
}
