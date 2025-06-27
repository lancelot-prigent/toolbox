provider "scaleway" {}

provider "github" {
  token = var.gh_pat_token
  owner = var.gh_owner
}

module "environment" {
  source = "../../modules/environment"

  env_name     = "staging"
  gh_repo_name = var.gh_repo_name
}
