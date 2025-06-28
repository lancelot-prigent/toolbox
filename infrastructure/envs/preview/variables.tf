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

variable "scw_access_key" {
  type        = string
  description = "Scaleway access key"
  sensitive   = true
}

variable "scw_secret_key" {
  type        = string
  description = "Scaleway secret key"
  sensitive   = true
}

variable "scw_organization_id" {
  type        = string
  description = "Scaleway organization ID"
  sensitive   = true
}
