# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Source Engine
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM        ich777/debian-baseimage

ENV         DEBIAN_FRONTEND noninteractive

# INSTALL NECESSARY PACKAGES
RUN         dpkg --add-architecture i386 \
            && apt-get update \
            && apt-get upgrade -y \
            && apt-get -y install --no-install-recommends lib32gcc1 lib32stdc++6
            
# CLEAN UP
RUN         apt-get clean
RUN         rm -rf /tmp/* /var/lib/apt/lists/*

RUN         useradd -m -d /home/container container

USER        container
ENV         HOME /home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/bash", "/entrypoint.sh"]
