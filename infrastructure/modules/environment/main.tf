module "github_env" {
  source = "../github_env"

  env_name     = var.env_name
  gh_repo_name = var.gh_repo_name
}

locals {
  project_name = lower("${var.env_name}-${var.gh_repo_name}")
}

module "scaleway_project" {
  source = "../scaleway_project"

  project_name = local.project_name
}

provider "scaleway" {
  zone       = "fr-par-2"
  region     = "fr-par"
  project_id = module.scaleway_project.project_id
}

module "api" {
  source = "../api"

  project_id   = module.scaleway_project.project_id
  project_name = local.project_name
}
