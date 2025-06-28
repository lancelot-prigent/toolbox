locals {
  api_container_name = "${var.project_name}-api"
}

resource "scaleway_container" "api" {
  name         = local.api_container_name
  namespace_id = scaleway_container_namespace.api.id

  # We ignore those changes because once the first image is deployed those values will change.
  registry_image = "traefik/whoami:latest"
  deploy         = true
  port           = 80

  lifecycle {
    # Port and registry image are ignored because once the first image is deployed those values will change through the CI/CD pipeline via API calls.
    ignore_changes = [
      registry_image,
      port
    ]
  }

  # Use centralized defaults or overrides
  min_scale    = var.container_min_scale
  max_scale    = var.container_max_scale
  cpu_limit    = var.container_cpu_limit
  memory_limit = var.container_memory_limit

  http_option = "redirected"


  # TODO: Add a health check
  # TODO: Add a domain
}

# resource "scaleway_container_domain" "api" {
#   lifecycle {
#     create_before_destroy = true
#   }

#   container_id = scaleway_container.api.id
#   hostname     = var.api_hostname
# }
