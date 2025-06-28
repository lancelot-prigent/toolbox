module "environment" {
  source = "../../modules/environment"

  env_name     = "pr-43"
  gh_repo_name = var.gh_repo_name
  gh_pat_token = var.gh_pat_token
}
