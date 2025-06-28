variable "env_name" {
  type        = string
  description = "Environment name"

  validation {
    condition     = length(var.env_name) > 0
    error_message = "Environment name must be provided"
  }

  validation {
    condition = anytrue([
      var.env_name == "dev",
      var.env_name == "staging",
      var.env_name == "prod",
      startswith(var.env_name, "pr-")
    ])
    error_message = "Environment name must be one of: dev, staging, prod, pr-<number>"
  }
}

variable "gh_repo_name" {
  type        = string
  description = "GitHub repository name"

  validation {
    condition     = length(var.gh_repo_name) > 0
    error_message = "GitHub repository name must be provided"
  }
}
