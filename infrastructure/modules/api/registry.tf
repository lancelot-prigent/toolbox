resource "scaleway_container_namespace" "api" {
  project_id = var.project_id
  name       = "${var.project_name}-ns-api"
}

resource "github_actions_environment_variable" "api_registry_endpoint" {
  environment   = var.env_name
  repository    = var.gh_repo_name
  variable_name = "API_REGISTRY_ENDPOINT"
  value         = scaleway_container_namespace.api.registry_endpoint
}
