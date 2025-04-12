#!/usr/bin/with-contenv bashio
# ==============================================================================
# Setup S6 Supervisor directories
# ==============================================================================

# Create required S6 directory structure
mkdir -p /var/run/s6/services

# Ensure s6-svscanctl is available and running
if [ ! -f /bin/s6-svscanctl ] && [ -f /usr/bin/s6-svscanctl ]; then
    ln -s /usr/bin/s6-svscanctl /bin/s6-svscanctl
fi

bashio::log.info "S6 directory structure created successfully" 