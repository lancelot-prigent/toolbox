module "environment" {
  source = "../../modules/environment"

  env_name     = "prod"
  gh_repo_name = var.gh_repo_name
}
