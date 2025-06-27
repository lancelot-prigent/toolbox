resource "github_repository" "this" {
  lifecycle {
    prevent_destroy = true
  }

  name                 = var.gh_repo_name
  is_template          = true
  description          = "A monorepo template with NestJS, React, React Native, OpenTofu and more. Powered by Nx."
  visibility           = "public"
  vulnerability_alerts = true

  topics = [
    "nx",
    "nestjs",
    "react",
    # "react-native",
    "tailwindcss",
    "typescript",
    "open-tofu",
    "scaleway"
  ]

  allow_merge_commit = false
  allow_rebase_merge = false
  allow_squash_merge = true

  squash_merge_commit_title   = "PR_TITLE"
  squash_merge_commit_message = "COMMIT_MESSAGES"

  allow_auto_merge       = true
  allow_update_branch    = true
  delete_branch_on_merge = true

  has_issues      = true
  has_projects    = false
  has_discussions = false
  has_downloads   = false
  has_wiki        = false
}

data "github_branch" "main" {
  repository = github_repository.this.name
  branch     = "main"
}

resource "github_branch_default" "main" {
  lifecycle {
    prevent_destroy = true
  }

  repository = github_repository.this.name
  branch     = "main"
}

resource "github_repository_ruleset" "default_branch" {
  lifecycle {
    prevent_destroy = true
  }

  name        = "default_branch_ruleset"
  repository  = github_repository.this.name
  target      = "branch"
  enforcement = "active"

  conditions {
    ref_name {
      exclude = []
      include = [
        "~DEFAULT_BRANCH"
      ]
    }
  }

  rules {
    deletion         = true
    non_fast_forward = true

    required_status_checks {
      strict_required_status_checks_policy = true

      required_check {
        context = "iac-plan"
      }
    }
  }
}
