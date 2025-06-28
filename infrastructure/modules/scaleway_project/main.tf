provider "scaleway" {
  zone   = "fr-par-2"
  region = "fr-par"
}

resource "scaleway_project" "project" {
  name = var.project_name
}
