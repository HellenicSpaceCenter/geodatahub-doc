# GeoDataHub ERM Internal Documentation Docker

This Docker setup builds the internal documentation using MkDocs and serves it via Nginx with basic authentication.

## Building the Image

From the project root directory:

```bash
docker build -t geodatahub-docs:latest -f docs/internal/docker/dockerfile docs/internal
```

## Running the Container

### Default credentials (admin / docs123):

```bash
docker run -p 8080:80 geodatahub-docs:latest
```

### Custom credentials via environment variables:

```bash
docker run \
  -p 8080:80 \
  -e DOCS_USERNAME=myuser \
  -e DOCS_PASSWORD=mysecurepassword \
  geodatahub-docs:latest
```

### Using .env file:

```bash
docker run \
  -p 8080:80 \
  --env-file .env \
  -e DOCS_USERNAME=${DOCS_USERNAME:-admin} \
  -e DOCS_PASSWORD=${DOCS_PASSWORD:-docs123} \
  geodatahub-docs:latest
```

## Accessing the Documentation

Once running, access the documentation at:

```
http://localhost:8080
```

Enter the credentials you provided (or admin/docs123 for defaults).

## Docker Compose Integration

Add to your `compose.yml`:

```yaml
docs:
  build:
    context: docs/internal
    dockerfile: docker/dockerfile
  container_name: geodatahub-docs
  ports:
    - "8080:80"
  environment:
    DOCS_USERNAME: ${DOCS_USERNAME:-admin}
    DOCS_PASSWORD: ${DOCS_PASSWORD:-docs123}
```

Then run:

```bash
docker-compose up docs
```

## Environment Variables

- `DOCS_USERNAME` - Documentation access username (default: `admin`)
- `DOCS_PASSWORD` - Documentation access password (default: `docs123`)

## Notes

- The documentation is built during the Docker build process using MkDocs
- All dependencies are defined in `docs/internal/requirements.txt`
- The Nginx configuration includes:
  - Basic HTTP authentication
  - Gzip compression for text assets
  - Security headers
  - 30-day cache for static assets
  - Automatic index.html serving for navigation
