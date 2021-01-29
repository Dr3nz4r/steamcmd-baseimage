# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Source Engine
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM        debian:buster-slim

ENV         DEBIAN_FRONTEND noninteractive

# Install Dependencies
RUN         dpkg --add-architecture i386 \
            && apt-get update \
            && apt-get upgrade -y \
            && apt-get -y install net-tools iproute2 wget locales procps lib32gcc1 lib32stdc++6 lib32stdc++6 lib32tinfo6 libncurses6 libprocps7 lib32tinfo6 libncurses5 ncurses-bin \
            && touch /etc/locale.gen \
            && echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
            && locale-gen \
            && apt-get -y install --reinstall ca-certificates \
            && rm -rf /var/lib/apt/lists/* \            
            && useradd -m -d /home/container container

ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

USER        container
ENV         HOME /home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/bash", "/entrypoint.sh"]
