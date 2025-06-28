resource "scaleway_container_namespace" "api" {
  project_id = var.project_id
  name       = "${var.project_name}-ns-api"
}
