terraform {
  required_providers {
    scaleway = {
      source  = "scaleway/scaleway"
      version = "2.56.0"
    }

    github = {
      source  = "integrations/github"
      version = "6.6.0"
    }
  }
}
