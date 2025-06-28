variable "project_id" {
  type        = string
  description = "The ID of the project"
}

variable "project_name" {
  type        = string
  description = "The name of the project"
}

variable "env_name" {
  type        = string
  description = "The name of the environment"
}

variable "gh_repo_name" {
  type        = string
  description = "The name of the GitHub repository"
}

variable "db_min_cpu" {
  type        = number
  description = "The minimum number of CPU units for your Serverless SQL Database"
  default     = 0
}

variable "db_max_cpu" {
  type        = number
  description = "The maximum number of CPU units for your Serverless SQL Database"
  default     = 1
}

variable "container_min_scale" {
  type        = number
  description = "The minimum of running container instances continuously."
  default     = 0
}

variable "container_max_scale" {
  type        = number
  description = "The maximum of number of instances this container can scale to."
  default     = 1
}

variable "container_cpu_limit" {
  type        = number
  description = "The amount of vCPU computing resources to allocate to each container. Defaults to 70."
  default     = 70
}

variable "container_memory_limit" {
  type        = number
  description = "The memory computing resources in MB to allocate to each container."
  default     = 128
}
