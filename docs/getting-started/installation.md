# Installation & Setup

Complete installation guide for GeoDataHub ERM deployment.

## System Requirements

### Minimum

- CPU: 2 cores
- RAM: 4GB
- Disk: 20GB
- OS: Linux, macOS, or Windows with WSL2

### Recommended

- CPU: 4+ cores
- RAM: 8GB+
- Disk: 100GB+ (for satellite imagery storage)
- OS: Linux (Ubuntu 20.04+)

## Installation Methods

### Docker Compose (Recommended)

Follow the Docker deployment guide for development and small deployments.

### Kubernetes

For production environments with high availability requirements.

### Local Development

For development without containers.

## Post-Installation Configuration

After installation, configure:

- User authentication (Keycloak)
- Data storage credentials (S3/MinIO)
- Email settings
- External integrations

## Verification

Ensure all services are running correctly and the platform is accessible.
