#!/usr/bin/with-contenv bashio
# ==============================================================================
# Setup Nginx for ingress support
# ==============================================================================

# Create directories for logs and temp files
mkdir -p /var/log/nginx
mkdir -p /var/lib/nginx/body
mkdir -p /tmp/nginx/client-body

# Make sure permissions are set correctly
chmod 777 /tmp/nginx

bashio::log.info "Nginx setup completed" 