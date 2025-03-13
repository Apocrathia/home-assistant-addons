# MCP Server Add-on

## Overview

The MCP (Model Context Protocol) Server add-on provides a bridge between your Home Assistant instance and Language Learning Models (LLMs), enabling natural language control and monitoring of your smart home devices.

This add-on integrates the [homeassistant-mcp](https://github.com/tevonsb/homeassistant-mcp) project with Home Assistant, allowing you to:

- Control any Home Assistant device through natural language
- Get real-time updates through Server-Sent Events (SSE)
- Create, update, and manage automations
- Track and query device states
- Securely access your Home Assistant instance from LLM applications

## Configuration

The add-on provides the following configuration options:

```yaml
debug: false
node_env: "production"
```

### Option: `debug`
- Enables debug logging if set to `true`
- Default value: `false`

### Option: `node_env`
- Sets the Node.js environment
- Default value: `"production"`

## Authentication

The MCP Server uses the Home Assistant Supervisor token for authentication. This token is automatically provided by the Home Assistant system and is used to authenticate requests to both Home Assistant and the MCP Server.

### Finding the Token

The token used by the MCP Server is output directly in the logs when the add-on starts. To find it:

1. Go to the Home Assistant interface
2. Navigate to **Settings** > **Add-ons** > **MCP Server** > **Logs**
3. Look for the section marked with `==== TOKEN FOR API AUTHENTICATION ====`
4. Copy the token that appears between the markers

When making requests to the MCP Server API, include the token in the Authorization header:
```
Authorization: Bearer YOUR_TOKEN_HERE
```

## How to use

1. Start the add-on
2. The MCP Server will be available at `http://your-home-assistant:3000`
3. The add-on integrates automatically with Home Assistant's authentication system
4. Access the MCP Server through the Home Assistant sidebar
5. For API requests, use the token as described in the Authentication section

## API Documentation

The MCP Server provides a RESTful API for interacting with your Home Assistant instance. The API documentation is available at `http://your-home-assistant:3000/docs` when the server is running.

## Troubleshooting

If you encounter issues with the add-on:

1. Check the add-on logs for error messages
2. Ensure your Home Assistant instance is running and accessible
3. Verify that the add-on has the necessary permissions
4. Restart the add-on if needed

## Support

For issues and feature requests, please visit the [GitHub repository](https://github.com/tevonsb/homeassistant-mcp). 