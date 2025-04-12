# MCP Inspector Add-on

The MCP Inspector add-on provides a visual interface for testing and debugging Model Context Protocol (MCP) servers, including the Home Assistant MCP Server Integration.

## Installation

Follow these steps to get the add-on installed on your system:

1. Navigate to the Home Assistant Add-on store
2. Add this repository as an add-on repository
3. Find the "MCP Inspector" add-on and click it
4. Click on the "INSTALL" button

## How to use

1. Start the add-on
2. Click "OPEN WEB UI" to launch the MCP Inspector interface
3. The add-on will be accessible through the Ingress interface

## Connecting to the Home Assistant MCP Server

To connect to the Home Assistant MCP Server:

1. In the MCP Inspector UI, select "SSE" as the Transport Type
2. Enter the URL to your Home Assistant MCP Server:
   - If using Ingress with Home Assistant: `http://homeassistant:8123/mcp_server/sse`
   - If accessing externally with SSL: `https://your-ha-host:8123/mcp_server/sse`
3. For authentication, enter a long-lived access token in the Bearer Token field
   - Create a long-lived access token in your Home Assistant profile under your user account settings
4. Click "Connect"

Note: The MCP Inspector does not automatically configure connections to your Home Assistant MCP Server. You must manually enter the connection details in the Inspector UI.

## Configuration

The add-on can be configured through the Home Assistant UI or via YAML configuration.

```yaml
client_port: 6274
server_port: 6277
mcp_server_request_timeout: 10000
mcp_proxy_full_address: ""
allow_origin: "*"
```

### Option: `client_port`

The port the MCP Inspector client UI listens on.

### Option: `server_port`

The port the MCP Inspector proxy server listens on.

### Option: `mcp_server_request_timeout`

Timeout in milliseconds for requests to MCP servers.

### Option: `mcp_proxy_full_address`

Custom address for the MCP Inspector Proxy. Only set this if you need to access the proxy from an external system.

### Option: `allow_origin`

CORS allow-origin setting for the proxy server.

## Support

- [Issue tracker](https://github.com/modelcontextprotocol/inspector/issues)
- [MCP Inspector documentation](https://github.com/modelcontextprotocol/inspector)
