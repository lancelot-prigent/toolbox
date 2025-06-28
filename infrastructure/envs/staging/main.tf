module "environment" {
  source = "../../modules/environment"

  env_name     = "staging"
  gh_repo_name = var.gh_repo_name

  scw_access_key      = var.scw_access_key
  scw_secret_key      = var.scw_secret_key
  scw_organization_id = var.scw_organization_id
}
