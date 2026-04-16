#!/bin/bash
set -e

# Get auth credentials from environment variables with defaults
DOCS_USERNAME=${DOCS_USERNAME:-admin}
DOCS_PASSWORD=${DOCS_PASSWORD:-docs123}

# Generate .htpasswd file
htpasswd -bc /etc/nginx/.htpasswd "$DOCS_USERNAME" "$DOCS_PASSWORD"

# Start nginx
exec nginx -g 'daemon off;'
