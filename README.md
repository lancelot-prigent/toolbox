# Toolbox

Monorepo template with NestJS, React, React Native and more. Powered by Nx.

## Quick Start

### Prerequisites

- Scaleway account with an organization and default project
- GitHub account with Actions access

### Initial Setup

#### 1. Repository Initialization

Use this repository as a template to create your new project.

#### 2. Github personal token

Generate a personnal token with permissions :
Added it to the secrets inside the repo as GH_PAT_TOKEN

#### 2. Scaleway Configuration

**IAM Application Creation:**

1. Navigate to the IAM section of your Scaleway organization
2. Create a new application with the following permissions:

| Scope           | Rule                                  |
| --------------- | ------------------------------------- |
| Organization    | `IAMManager`                          |
| Default project | `ObjectStorageBucketPolicyFullAccess` |
| Default project | `ObjectStorageFullAccess`             |

**API Keys Generation:**

1. Generate an API key for your application
2. Set expiration to 30 days maximum (enhanced security)
3. Save both access key and secret key

#### 3. GitHub Configuration

In your GitHub repository settings, configure the following variables and secrets:

| Type     | Name             | Value                         |
| -------- | ---------------- | ----------------------------- |
| Variable | `SCW_ORG_ID`     | Your Scaleway organization ID |
| Secret   | `SCW_ACCESS_KEY` | Access key from your API key  |
| Secret   | `SCW_SECRET_KEY` | Secret key from your API key  |

#### 4. Infrastructure Deployment

Run the "Terraform Plan" then "Terraform Apply" GitHub Actions to provision your infrastructure.

## Architecture

Infrastructure is managed via Terraform and stored in the `infrastructure/core/` directory.
