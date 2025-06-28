provider "scaleway" {
  alias           = "project_creator"
  zone            = "fr-par-2"
  region          = "fr-par"
  access_key      = var.scw_access_key
  secret_key      = var.scw_secret_key
  organization_id = var.scw_organization_id
}

resource "scaleway_account_project" "project" {
  provider = scaleway.project_creator
  name     = var.project_name
}
