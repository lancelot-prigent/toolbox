module "github_env" {
  source = "./github_env"

  env_name     = var.env_name
  gh_repo_name = var.gh_repo_name
}
