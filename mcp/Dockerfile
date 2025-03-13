ARG BUILD_FROM
FROM $BUILD_FROM

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Install Node.js and npm
RUN \
    apk add --no-cache \
        nodejs \
        npm \
        git \
        python3 \
        make \
        g++

# Set working directory
WORKDIR /app

# Clone MCP server repository
RUN git clone https://github.com/tevonsb/homeassistant-mcp.git . && \
    npm install

# Build TypeScript
RUN npm run build && \
    # Verify build output
    ls -la dist/src && \
    # Clean up build dependencies
    apk del git make g++ python3 && \
    rm -rf /root/.npm /root/.cache

# Copy our run script and services
COPY rootfs/etc /etc

# Make our scripts executable
RUN chmod a+x /etc/services.d/mcp/run \
    && chmod a+x /etc/services.d/mcp/finish

# Labels
LABEL \
    io.hass.name="MCP Server" \
    io.hass.description="Model Context Protocol Server for Home Assistant" \
    io.hass.type="addon" \
    io.hass.version="1.0.0" \
    io.hass.arch="armhf|aarch64|i386|amd64"

# Set up environment
ENV \
    LANG="C.UTF-8" \
    TERM="xterm-256color" \
    NODE_ENV="production" 