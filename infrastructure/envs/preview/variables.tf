variable "gh_repo_name" {
  type        = string
  description = "GitHub repository name"
}

variable "pr_number" {
  type        = number
  description = "Pull request number"

  validation {
    condition     = var.pr_number > 0
    error_message = "Pull request number must be greater than 0"
  }
}
