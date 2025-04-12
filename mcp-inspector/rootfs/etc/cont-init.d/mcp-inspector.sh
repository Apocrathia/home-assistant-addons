#!/usr/bin/with-contenv bashio
# ==============================================================================
# Set up MCP Inspector service
# ==============================================================================

# Create data directory for the app if needed
mkdir -p /data

# Log that initialization is complete
cd /data
bashio::log.info "MCP Inspector initialization completed" 