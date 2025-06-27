variable "gh_pat_token" {
  type        = string
  description = "GitHub personal access token with permissions over the repository"
  sensitive   = true
}

variable "gh_owner" {
  type        = string
  description = "GitHub owner"
}

variable "gh_repo_name" {
  type        = string
  description = "GitHub repository name"
}
