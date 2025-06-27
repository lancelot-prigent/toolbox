provider "scaleway" {}

provider "github" {
  token = var.gh_pat_token
  owner = var.gh_owner
}
