#!/bin/bash

# Environment Setup
CONFIG_PATH=/data/options.json

# User Configuration
METHOD=$(jq --raw-output ".method" $CONFIG_PATH)
DOMAIN=$(jq --raw-output ".domain" $CONFIG_PATH)
DNSPROVIDER=$(jq --raw-output ".dnsprovider" $CONFIG_PATH)
EMAIL=$(jq --raw-output ".email" $CONFIG_PATH)
APIKEY=$(jq --raw-output ".apikey" $CONFIG_PATH)
KEYFILE=$(jq --raw-output ".keyfile" $CONFIG_PATH)
CERTFILE=$(jq --raw-output ".certfile" $CONFIG_PATH) 

# Static Configuration
DATA_DIR="/data"
SSL_DIR="/ssl"

# First, grab acme.sh
curl https://get.acme.sh | sh

# Go to acme.sh directory
cd ~/.acme.sh/

# Export DNS provider Variables
# Full list can be found here:
# https://github.com/Neilpang/acme.sh/tree/master/dnsapi
case $DNSPROVIDER in
  "dns_acmedns")
    echo "Support for $DNSPROVIDER has not yet been fully implemented."
    ;;
  "dns_ad")
    echo "Support for $DNSPROVIDER has not yet been fully implemented."
    ;;
  "dns_ali")
    echo "Support for $DNSPROVIDER has not yet been fully implemented."
    ;;
  "dns_autodns")
    echo "Support for $DNSPROVIDER has not yet been fully implemented."
    ;;
  "dns_aws")
    echo "Support for $DNSPROVIDER has not yet been fully implemented."
    ;;
  "dns_azure")
    echo "Support for $DNSPROVIDER has not yet been fully implemented."
    ;;
  "dns_cf")
    export CF_Key=${APIKEY}
    export CF_Email=${EMAIL}
    ;;
  "dns_cloudns")
    echo "Support for $DNSPROVIDER has not yet been fully implemented."
    ;;
  "dns_cx")
    echo "Support for $DNSPROVIDER has not yet been fully implemented."
    ;;
  "dns_cyon")
    echo "Support for $DNSPROVIDER has not yet been fully implemented."
    ;;
  "dns_da")
    echo "Support for $DNSPROVIDER has not yet been fully implemented."
    ;;
  "dns_dgon")
    echo "Support for $DNSPROVIDER has not yet been fully implemented."
    ;;
  "dns_dnsimple")
    echo "Support for $DNSPROVIDER has not yet been fully implemented."
    ;;
  "dns_do")
    echo "Support for $DNSPROVIDER has not yet been fully implemented."
    ;;
  "dns_dp")
    echo "Support for $DNSPROVIDER has not yet been fully implemented."
    ;;
  "dns_dreamhost")
    echo "Support for $DNSPROVIDER has not yet been fully implemented."
    ;;
  "dns_duckdns")
    echo "Support for $DNSPROVIDER has not yet been fully implemented."
    ;;
  "dns_dyn")
    echo "Support for $DNSPROVIDER has not yet been fully implemented."
    ;;
  "dns_dynu")
    echo "Support for $DNSPROVIDER has not yet been fully implemented."
    ;;
  "dns_freedns")
    echo "Support for $DNSPROVIDER has not yet been fully implemented."
    ;;
  "dns_gandi_livedns")
    echo "Support for $DNSPROVIDER has not yet been fully implemented."
    ;;
  "dns_gd")
    echo "Support for $DNSPROVIDER has not yet been fully implemented."
    ;;
  "dns_he")
    echo "Support for $DNSPROVIDER has not yet been fully implemented."
    ;;
  "dns_infoblox")
    echo "Support for $DNSPROVIDER has not yet been fully implemented."
    ;;
  "dns_inwx")
    echo "Support for $DNSPROVIDER has not yet been fully implemented."
    ;;
  "dns_ispconfig")
    echo "Support for $DNSPROVIDER has not yet been fully implemented."
    ;;
  "dns_kinghost")
    echo "Support for $DNSPROVIDER has not yet been fully implemented."
    ;;
  "dns_knot")
    echo "Support for $DNSPROVIDER has not yet been fully implemented."
    ;;
  "dns_lexicon")
    echo "Support for $DNSPROVIDER has not yet been fully implemented."
    ;;
  "dns_linode")
    echo "Support for $DNSPROVIDER has not yet been fully implemented."
    ;;
  "dns_loopia")
    echo "Support for $DNSPROVIDER has not yet been fully implemented."
    ;;
  "dns_lua")
    echo "Support for $DNSPROVIDER has not yet been fully implemented."
    ;;
  "dns_me")
    echo "Support for $DNSPROVIDER has not yet been fully implemented."
    ;;
  "dns_myapi")
    echo "Support for $DNSPROVIDER has not yet been fully implemented."
    ;;
  "dns_namecom")
    echo "Support for $DNSPROVIDER has not yet been fully implemented."
    ;;
  "dns_namesilo")
    echo "Support for $DNSPROVIDER has not yet been fully implemented."
    ;;
  "dns_nsone")
    echo "Support for $DNSPROVIDER has not yet been fully implemented."
    ;;
  "dns_nsupdate")
    echo "Support for $DNSPROVIDER has not yet been fully implemented."
    ;;
  "dns_ovh")
    echo "Support for $DNSPROVIDER has not yet been fully implemented."
    ;;
  "dns_pdns")
    echo "Support for $DNSPROVIDER has not yet been fully implemented."
    ;;
  "dns_selectel")
    echo "Support for $DNSPROVIDER has not yet been fully implemented."
    ;;
  "dns_servercow")
    echo "Support for $DNSPROVIDER has not yet been fully implemented."
    ;;
  "dns_tele3")
    echo "Support for $DNSPROVIDER has not yet been fully implemented."
    ;;
  "dns_unoeuro")
    echo "Support for $DNSPROVIDER has not yet been fully implemented."
    ;;
  "dns_vscale")
    echo "Support for $DNSPROVIDER has not yet been fully implemented."
    ;;
  "dns_yandex")
    echo "Support for $DNSPROVIDER has not yet been fully implemented."
    ;;
  "dns_zilore")
    echo "Support for $DNSPROVIDER has not yet been fully implemented."
    ;;
  "dns_zonomi")
    echo "Support for $DNSPROVIDER has not yet been fully implemented."
    ;;
  "dns_provider")
    echo "Please enter a valid DNS provider if using DNS-01 challenges."
    ;;
  "disabled")
    echo "DNS challenege disabled."
    ;;
  *)
    echo "Please enter a valid DNS provider."
    ;;
esac

# Determine how to get the certificate
if [ ${METHOD} == "http" ]; then
  # Run the command
  ./acme.sh --issue --standalone -d $DOMAIN
  
  # Now to copy the certs to the SSL directory
  cp -rfv $DOMAIN/fullchain.cer $SSL_DIR/$CERTFILE
  cp -rfv $DOMAIN/$DOMAIN.key $SSL_DIR/$KEYFILE
elif [ ${METHOD} == "dns" ]; then
  # Run the command
  ./acme.sh --issue --dns $DNSPROVIDER -d $DOMAIN
  
  # Now to copy the certs to the SSL directory
  cp -rfv $DOMAIN/fullchain.cer $SSL_DIR/$CERTFILE
  cp -rfv $DOMAIN/$DOMAIN.key $SSL_DIR/$KEYFILE
else
  echo "Please declare a valid challenge method"
  exit
fi

echo "Your certificate for ${DOMAIN} is ready!"
echo "Please configure Home Assistant to do its thing."
echo "Or don't. I don't care. I just work here."