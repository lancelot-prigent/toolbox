locals {
  application_name = "${var.project_name}-api"
}

resource "scaleway_iam_application" "api" {
  name        = local.application_name
  description = "IAM application for the API"
}
