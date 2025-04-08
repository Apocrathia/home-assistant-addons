#!/usr/bin/with-contenv bashio

# Get configuration values
CLIENT_PORT=$(bashio::config 'client_port')
SERVER_PORT=$(bashio::config 'server_port')
MCP_SERVER_REQUEST_TIMEOUT=$(bashio::config 'mcp_server_request_timeout')
MCP_PROXY_FULL_ADDRESS=$(bashio::config 'mcp_proxy_full_address')
HA_MCP_SERVER=$(bashio::config 'ha_mcp_server')
HA_ACCESS_TOKEN=$(bashio::config 'ha_access_token')

# Log configuration
bashio::log.info "Starting MCP Inspector..."
bashio::log.info "Client port: ${CLIENT_PORT}"
bashio::log.info "Server port: ${SERVER_PORT}"
bashio::log.info "MCP server request timeout: ${MCP_SERVER_REQUEST_TIMEOUT}"
if [ -n "${MCP_PROXY_FULL_ADDRESS}" ]; then
    bashio::log.info "MCP proxy full address: ${MCP_PROXY_FULL_ADDRESS}"
else
    bashio::log.info "MCP proxy full address: not set (using default)"
fi

# Check if HA MCP server integration should be used
if bashio::config.true 'ha_mcp_server'; then
    bashio::log.info "Home Assistant MCP server: enabled"
    
    # Set default access token if not provided
    if [ -z "${HA_ACCESS_TOKEN}" ]; then
        bashio::log.warning "No access token provided for Home Assistant MCP server, authentication may fail"
    else
        bashio::log.info "Home Assistant MCP server access token: configured"
    fi
    
    # Get HA URL from Supervisor API
    HA_URL=$(bashio::supervisor.api.host)
    
    # Save connection info to a file for easy access in the UI
    mkdir -p /data/ha_mcp_info
    cat > /data/ha_mcp_info/connection.json << EOL
{
  "url": "http://${HA_URL}/mcp_server/sse",
  "hasToken": $([ -n "${HA_ACCESS_TOKEN}" ] && echo "true" || echo "false")
}
EOL
    
    bashio::log.info "Home Assistant MCP server URL: http://${HA_URL}/mcp_server/sse"
fi

# Export environment variables for MCP Inspector
export CLIENT_PORT="${CLIENT_PORT}"
export SERVER_PORT="${SERVER_PORT}"
export MCP_SERVER_REQUEST_TIMEOUT="${MCP_SERVER_REQUEST_TIMEOUT}"
if [ -n "${MCP_PROXY_FULL_ADDRESS}" ]; then
    export MCP_PROXY_FULL_ADDRESS="${MCP_PROXY_FULL_ADDRESS}"
fi

# Run MCP Inspector
npx @modelcontextprotocol/inspector 