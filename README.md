# 🧰 Toolbox - Monorepo Template

A comprehensive monorepo template with **NestJS**, **React**, **React Native**, and automated preview environments. Powered by **Nx** for superior developer experience and **OpenTofu** for infrastructure as code.

## ✨ Features

- **🏗️ Full-Stack Architecture**: Complete setup with backend API, web frontend, and mobile app
- **⚡ Nx Monorepo**: Optimized build system with intelligent caching and dependency graph
- **🚀 Automated Preview Environments**: Deploy isolated environments for every pull request
- **🏗️ Infrastructure as Code**: Scaleway infrastructure managed with OpenTofu
- **🔄 GitHub Actions**: Comprehensive CI/CD pipeline with automated testing and deployment
- **📱 Cross-Platform**: Web and mobile applications sharing common libraries
- **🎨 Modern Stack**: TypeScript, Tailwind CSS, and best practices out of the box

## 🏗️ Architecture

```
apps/
├── api/          # NestJS backend API
├── web/          # React web application
└── mobile/       # React Native mobile app

libs/
├── shared/       # Shared utilities and types
├── ui/           # Common UI components
└── data/         # Data access layer

infrastructure/
├── core/         # Core infrastructure (VPC, databases)
└── environments/ # Preview environment templates

.github/
├── workflows/    # CI/CD pipelines
└── scripts/      # Automation scripts
```

## 🚀 Tech Stack

### Frontend

- **React 19** with TypeScript
- **React Native** for mobile development with expo
- **Tailwind CSS** for styling
- **Nx** for monorepo management

### Backend

- **NestJS** with TypeScript
- **PostgreSQL** database
- **Redis** for caching
- **OpenAPI/Swagger** documentation

### Infrastructure

- **Scaleway** cloud platform
- **OpenTofu** for infrastructure as code
- **GitHub Actions** for CI/CD
- **Preview environments** for every PR

### DevOps

- **GitHub Apps** for secure automation
- **Automated testing** and quality checks
- **Dependency management** with Nx
- **Code generation** and scaffolding

## 🎮 Preview Environments

Every pull request can have its own isolated preview environment:

- **🏷️ Label-based**: Add `preview` label to deploy
- **🔄 Auto-sync**: Automatically updates with new commits
- **🧹 Auto-cleanup**: Destroys environments when PR is closed

## 🚀 Getting Started

### Prerequisites

- Node.js 22+ and pnpm
- GitHub organization account
- Scaleway account

### Quick Start

1. **Use this template** to create a new repository in your organization
2. **Follow the setup guide** in [`docs/setup.md`](docs/setup.md) for complete configuration
3. **Start developing** with the configured monorepo

```bash
# Install dependencies
npm install

# Start development servers
npx nx run-many --target=serve --projects=api,web

# Run tests
npx nx run-many --target=test --all

# Build all applications
npx nx run-many --target=build --all
```

## 📖 Documentation

- **[📋 Setup Guide](docs/setup.md)** - Complete setup instructions for new projects
- **[🏗️ Architecture](docs/architecture.md)** - Detailed architecture documentation
- **[🚀 Development](docs/development.md)** - Development workflow and best practices
- **[🔧 Infrastructure](docs/infrastructure.md)** - Infrastructure management guide

## 🎯 Available Scripts

```bash
# Development
npx nx serve api              # Start API server
npx nx serve web              # Start web development server
npx nx run mobile:start       # Start React Native metro bundler

# Testing
npx nx test api               # Run API tests
npx nx test web               # Run web tests
npx nx run-many --target=test # Run all tests

# Building
npx nx build api              # Build API for production
npx nx build web              # Build web for production
npx nx run-many --target=build # Build all projects

# Code Quality
npx nx lint                   # Run linting
npx nx format                 # Format code
npx nx affected:test          # Test affected projects only
```

## 🌟 Key Benefits

- **🔥 Fast Development**: Hot reload, instant feedback, and optimized builds
- **🧪 Quality Assured**: Automated testing, linting, and code formatting
- **📦 Modular**: Shared libraries and components across applications
- **🚀 Production Ready**: Scalable infrastructure and deployment pipeline
- **👥 Team Friendly**: Consistent development environment and processes
- **💰 Cost Effective**: Preview environments with automatic cleanup

## 🔧 Customization

This template is designed to be customized for your specific needs:

- **Add new applications**: Use Nx generators to scaffold new apps
- **Extend infrastructure**: Modify OpenTofu configurations in `infrastructure/`
- **Configure CI/CD**: Customize GitHub Actions workflows
- **Add integrations**: Extend with additional services and tools

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Add the `preview` label to your PR to test changes
4. Commit your changes (`git commit -m 'Add amazing feature'`)
5. Push to the branch (`git push origin feature/amazing-feature`)
6. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🆘 Support

- **[Issues](../../issues)** - Report bugs or request features
- **[Discussions](../../discussions)** - Ask questions and share ideas
- **[Setup Guide](docs/setup.md)** - Complete setup instructions

---

**Ready to build something amazing?** Follow the [setup guide](docs/setup.md) to get started! 🚀
