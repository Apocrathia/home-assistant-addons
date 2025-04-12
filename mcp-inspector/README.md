# Home Assistant Add-on: MCP Inspector

![MCP Inspector](icon.png)

## About

MCP Inspector is a development tool for testing and debugging Model Context Protocol (MCP) servers.

It provides a visual interface to:

- Test MCP server implementations
- Monitor requests and responses
- Debug server behavior
- Configure test parameters
- Test Home Assistant's own MCP Server integration

This addon wraps the official [MCP Inspector](https://github.com/modelcontextprotocol/inspector) tool in a Home Assistant addon, making it easy to run in your Home Assistant environment.

## Features

- Visual testing tool for MCP servers
- Configurable client and server ports
- Adjustable request timeout
- Web UI for easy interaction
- Support for bearer token authentication
- Built-in integration with Home Assistant's MCP Server

## Installation

Follow these steps to install the add-on:

1. Navigate to the Home Assistant Add-on Store
2. Click the three dots menu in the top right and select "Repositories"
3. Add this repository URL
4. The MCP Inspector add-on will appear in the add-on store
5. Click on it and then click "Install"

## How to use

1. Start the add-on
2. Open the web UI by clicking "Open Web UI" or navigating to your HA instance at port 6274
3. Use the inspector to test your MCP server

### Testing Home Assistant's MCP Server

If you have the [Home Assistant MCP Server integration](https://www.home-assistant.io/integrations/mcp_server/) enabled, you can test it with MCP Inspector:

1. Create a [Long-lived access token](https://developers.home-assistant.io/docs/auth_api/#long-lived-access-token) in your Home Assistant user profile
2. In the MCP Inspector UI, use the URL `http://homeassistant:8123/mcp_server/sse` (or your external URL)
3. Add your access token as a Bearer Token in the authentication section
4. Click "Connect" to establish a connection to your Home Assistant MCP server

## Configuration Options

| Option                     | Description                                                             | Default |
| -------------------------- | ----------------------------------------------------------------------- | ------- |
| client_port                | The port for the MCP Inspector client UI                                | 6274    |
| server_port                | The port for the MCP proxy server                                       | 6277    |
| mcp_server_request_timeout | Timeout for requests to MCP server (ms)                                 | 10000   |
| mcp_proxy_full_address     | Full URL of the MCP Inspector proxy server (e.g. http://10.2.1.14:6277) | ""      |
| allow_origin               | CORS allow-origin setting for the proxy server                          | "\*"    |

## Support

For issues with the MCP Inspector itself, please refer to the [MCP Inspector GitHub repository](https://github.com/modelcontextprotocol/inspector).

For issues with this Home Assistant add-on, please open an issue in the add-on repository.
