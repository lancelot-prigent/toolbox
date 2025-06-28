# Toolbox Template Setup Guide

This repository provides a comprehensive monorepo template with automated preview environments powered by NestJS, React, React Native, and Nx. Follow this guide to set up the project in your organization.

## 📋 Prerequisites

- GitHub organization account
- Scaleway account
- Administrative access to your GitHub organization

## 🚀 Setup Instructions

### 1. Use This Repository as a Template

1. Navigate to this repository on GitHub
2. Click the **"Use this template"** button
3. Select **"Create a new repository"**
4. Choose your organization as the owner
5. Name your new repository
6. Click **"Create repository from template"**

### 2. Create a Scaleway Account

1. Go to [Scaleway Console](https://console.scaleway.com/)
2. Sign up for a new account or log in to your existing account
3. Complete the account verification process
4. Note your **Organization ID** from the console (you'll need this later)

### 3. Generate Scaleway API Keys

1. In the Scaleway Console, navigate to **IAM > API Keys**
2. Click **"Generate API key"**
3. Configure the API key with the following permissions:
   - `IAMManager`
   - `ObjectStorageBucketPolicyFullAccess`
   - `ObjectStorageFullAccess`
4. Download and securely store:
   - **Access Key** (public key)
   - **Secret Key** (private key)

> ⚠️ **Important**: Store these keys securely as they cannot be retrieved again.

### 4. Create a GitHub App

1. In your GitHub organization, go to **Settings > Developer settings > GitHub Apps**
2. Click **"New GitHub App"**
3. Fill in the required information:
   - **GitHub App name**: `Tofu Manager` (or your preferred name)
   - **Description**: `Manages preview environments and infrastructure`
   - **Homepage URL**: Your repository URL
   - **Webhook URL**: Leave blank (not needed for this setup)
4. Configure **Repository permissions**:
   - **Administration**: `Write`
   - **Contents**: `Read`
   - **Environments**: `Write`
   - **Pull requests**: `Write`
   - **Issues**: `Write`
5. **Subscribe to events**: Select `Pull request` and `Issue comment`
6. **Where can this GitHub App be installed?**: Select `Only on this account`
7. Click **"Create GitHub App"**

### 5. Generate GitHub App Credentials

1. After creating the app, note the **App ID** (you'll need this as `TOFU_MANAGER_CLIENT_ID`)
2. Scroll down to **Private keys** section
3. Click **"Generate a private key"**
4. Download the `.pem` file and copy its entire content (including headers)

### 6. Install the GitHub App

1. In your GitHub App settings, click **"Install App"**
2. Select your organization
3. Choose **"Selected repositories"** and select your new repository
4. Click **"Install"**

### 7. Configure Repository Secrets and Variables

Navigate to your repository → **Settings > Secrets and variables > Actions**

#### Add Repository Secrets

Click **"New repository secret"** for each:

| Secret Name               | Value                         | Description                         |
| ------------------------- | ----------------------------- | ----------------------------------- |
| `SCW_ACCESS_KEY`          | Your Scaleway Access Key      | Public part of Scaleway API key     |
| `SCW_SECRET_KEY`          | Your Scaleway Secret Key      | Private part of Scaleway API key    |
| `SCW_ORGANIZATION_ID`     | Your Scaleway Organization ID | Found in Scaleway Console           |
| `TOFU_MANAGER_APP_SECRET` | Your GitHub App Private Key   | Complete content of the `.pem` file |

#### Add Repository Variables

Click **"Variables" tab**, then **"New repository variable"**:

| Variable Name            | Value              | Description                         |
| ------------------------ | ------------------ | ----------------------------------- |
| `TOFU_MANAGER_CLIENT_ID` | Your GitHub App ID | Numeric ID from GitHub App settings |

## ✅ Verification

Your repository is now ready! To verify the setup:

1. Create a new pull request
2. Add the `preview` label to the PR
3. Check that the preview environment workflow triggers successfully
4. Verify that infrastructure resources are created in your Scaleway account

## 🎮 Usage

### Preview Environments

Preview environments are automatically managed based on PR labels:

#### Labels

- Add `preview` label → Deploy preview environment
- Remove `preview` label → Destroy preview environment

### Monitoring

- Preview environment status is displayed in PR comments
- Infrastructure state is managed automatically
- Failed deployments are reported with error details

## 🔧 Customization

### Infrastructure Configuration

Modify the Terraform configuration in `infrastructure/` to customize:

- Instance types and sizing
- Network configuration
- Database settings
- Monitoring and logging

## 🆘 Troubleshooting

### Common Issues

1. **403 Permission Errors**

   - Verify GitHub App has correct permissions
   - Check that the app is installed on your repository

2. **Scaleway API Errors**

   - Confirm API keys have required permissions
   - Verify Organization ID is correct

3. **Workflow Not Triggering**
   - Check that workflows are enabled in repository settings
   - Verify GitHub App subscribes to correct events

### Getting Help

- Check the [Issues](../../issues) section for known problems
- Review workflow logs in the **Actions** tab
- Consult Scaleway documentation for infrastructure issues

## 🔒 Security Notes

- Keep all secrets secure and never commit them to the repository
- Regularly rotate API keys and GitHub App credentials
- Use least-privilege principles for all permissions
- Monitor resource usage to prevent unexpected costs

---

## 🎉 Ready to Go!

Your toolbox template is now configured and ready for development. Create pull requests, add the `preview` label, and watch your preview environments come to life!

For questions or issues, please open an issue in this repository.
