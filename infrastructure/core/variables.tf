variable "gh_pat_token" {
  type        = string
  description = "GitHub personal access token with permissions over the repository"
  sensitive   = true
}
