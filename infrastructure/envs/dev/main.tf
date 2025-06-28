module "environment" {
  source = "../../modules/environment"

  env_name     = "dev"
  gh_repo_name = var.gh_repo_name
}
