locals {
  db_name     = "${var.project_name}-db-main"
  policy_name = "${local.db_name}-rw-policy"
}

resource "scaleway_sdb_sql_database" "main" {
  name       = "${var.project_name}-db-main"
  project_id = var.project_id

  min_cpu = var.db_min_cpu
  max_cpu = var.db_max_cpu

  lifecycle {
    create_before_destroy = true
  }
}

resource "scaleway_iam_policy" "main_rw" {
  name           = local.policy_name
  description    = "Policy to allow read and write access to the main database"
  application_id = scaleway_iam_application.api.id

  rule {
    project_ids          = [var.project_id]
    permission_set_names = ["ServerlessSQLDatabaseReadWrite"]
  }
}
