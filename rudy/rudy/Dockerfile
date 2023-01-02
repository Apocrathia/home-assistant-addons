# https://developers.home-assistant.io/docs/add-ons/configuration#add-on-dockerfile
ARG BUILD_FROM
FROM $BUILD_FROM

# Execute during the build of the image
ARG TEMPIO_VERSION BUILD_ARCH
RUN \
    curl -sSLf -o /usr/bin/tempio \
    "https://github.com/home-assistant/tempio/releases/download/${TEMPIO_VERSION}/tempio_${BUILD_ARCH}"

RUN  apk update && apk add --no-cache linux-tools-usbip mosquitto-clients
RUN  if [ ! -e /usr/share/hwdata/usb.ids ]; then mkdir -p /usr/share/hwdata && ln -s /dev/null /usr/share/hwdata/usb.ids; fi

# Copy root filesystem
COPY rootfs /
