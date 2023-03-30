FROM almalinux:9-minimal

LABEL maintainer="Israel Perez <isra1998isra@gmail.com>" \
        version="1.0" \
        description="Rocket Streaming Audio Server" \
        github="https://github.com/IsraPerez98/rsas-docker"

ENV DOWNLOAD_URL="https://rocketbroadcaster.com/streaming-audio-server/downloads/centos8/rsas-1.0.3.0-1.el8.x86_64.rpm"

# Install dependencies

RUN microdnf install -y wget \
    dnf

# Install Rocket Streaming Audio Server

RUN dnf install -y https://rocketbroadcaster.com/streaming-audio-server/downloads/centos8/rsas-1.0.3.0-1.el8.x86_64.rpm

# Set default config in case it's not mounted

RUN cp /etc/rsas/rsas.xml.example_simple /etc/rsas/rsas.xml

RUN chown -R rsas:rsas /etc/rsas

# Prepare log files

RUN mkdir -p /var/log/rsas

RUN touch /var/log/rsas/error.log && \
    touch /var/log/rsas/access.log && \
    touch /var/log/rsas/playlist.log

RUN chown -R rsas:rsas /var/log/rsas

# Clean up

RUN microdnf remove -y wget

RUN microdnf clean all

# Run Rocket Streaming Audio Server

USER rsas

#CMD [ "/usr/bin/rsas", "-c", "/etc/rsas/rsas.xml" ]

CMD [ "/bin/sh", "-c", "/usr/bin/rsas -c /etc/rsas/rsas.xml" ]