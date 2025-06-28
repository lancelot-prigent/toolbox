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
