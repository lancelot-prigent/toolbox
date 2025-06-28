module "environment" {
  source = "../../modules/environment"

  env_name     = "prod"
  gh_repo_name = var.gh_repo_name
  gh_pat_token = var.gh_pat_token
  gh_owner     = var.gh_owner
}
