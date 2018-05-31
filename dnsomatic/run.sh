#!/bin/bash
set -e

# Environment Setup
CONFIG_PATH=/data/options.json

# User Configuration Variables
HOSTNAME=$(jq --raw-output ".hostname" $CONFIG_PATH)
USERNAME=$(jq --raw-output ".username" $CONFIG_PATH)
PASSWORD=$(jq --raw-output ".password" $CONFIG_PATH)

# Generated Variables
MYIP=$(curl -s http://myip.dnsomatic.com/)

# Static Variables
WILDCARD=${WILDCARD:-NOCHG}
MX=${MX:-NOCHG}
BACKMX=${BACKMX:-NOCHG}

# Logging output
echo "Got username: ${USERNAME} & password: ${PASSWORD}"
echo "Updating ${HOSTNAME} with ${MYIP}"

# Push update to DNS-O-Matic
curl -s -u "${USERNAME}:${PASSWORD}" "https://updates.dnsomatic.com/nic/update?myip=${myIP}&hostname=${HOSTNAME}&wildcard=${WILDCARD}&mx=${MX}&backmx=${BACKMX}"
#curl -s "https://"${USERNAME}:${PASSWORD}"@updates.dnsomatic.com/nic/update?myip=${myIP}&hostname=${HOSTNAME}&wildcard=${WILDCARD}&mx=${MX}&backmx=${BACKMX}"
