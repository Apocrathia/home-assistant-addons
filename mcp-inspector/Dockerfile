ARG BUILD_FROM
FROM $BUILD_FROM

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Install requirements for add-on
RUN \
    apk add --no-cache \
        nodejs \
        npm \
        git

# Install MCP Inspector
RUN \
    npm install -g @modelcontextprotocol/inspector

# Copy data for add-on
COPY rootfs /

# Set working directory
WORKDIR /data

# Labels
LABEL \
    io.hass.name="MCP Inspector" \
    io.hass.description="A development tool for testing and debugging MCP servers" \
    io.hass.type="addon" \
    io.hass.version="0.1.0" \
    io.hass.arch="armhf|aarch64|i386|amd64|armv7"

CMD ["/usr/bin/run.sh"] 