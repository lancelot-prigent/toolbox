module "environment" {
  source = "../../modules/environment"

  env_name     = "pr-${var.pr_number}"
  gh_repo_name = var.gh_repo_name
}
