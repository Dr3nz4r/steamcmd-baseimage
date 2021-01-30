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
            && apt-get -y install ca-certificates curl g++ gcc gcc-8-base iproute2 lib32* lib32gcc1 lib32stdc* lib32stdc++ lib32stdc++6 lib32tinfo6 lib32z1 libc-bin libncurses5 libncurses6 libncursesw5 libprocps7 libstdc++6 libtinfo5 libxcursor1 libxext6 libxft2 libxft2:i386 libxinerama1 locales ncurses-bin net-tools procps wget \
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
