# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Source Engine
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM        debian:buster-slim
#FROM        ubuntu:focal

ENV         DEBIAN_FRONTEND noninteractive


ENV DEBIAN_FRONTEND noninteractive
# INSTALL NECESSARY PACKAGES
RUN         dpkg --add-architecture i386 \
            && apt-get update \
            && apt-get -y --no-install-recommends --no-install-suggests install \
                        wget ca-certificates tar gcc g++ lib32gcc1 libgcc1 libcurl4-gnutls-dev:i386 libssl1.1 libcurl4:i386 libtinfo5 lib32z1 lib32stdc++6 libncurses5:i386 libcurl3-gnutls:i386 gdb libsdl1.2debian libfontconfig net-tools

# CLEAN UP
RUN         apt-get clean
RUN         rm -rf /tmp/* /var/lib/apt/lists/*

RUN         useradd -m -d /home/container container

# Install Dependencies
#RUN         dpkg --add-architecture i386 \
#            && apt-get update \
#            && apt-get upgrade -y \
#            && apt-get -y install --no-install-recommends \
#                       libtcmalloc-minimal4 libtcmalloc-minimal4:i386 tmux locales net-tools wget ca-certificates tar gcc g++ lib32gcc1 libgcc1 libcurl4-gnutls-dev:i386 libssl1.1 libcurl4:i386 libtinfo5 lib32z1 lib32stdc++6 libncurses5:i386 libcurl3-gnutls:i386 gdb libsdl1.2debian libfontconfig net-tools \
#            && touch /etc/locale.gen \
#            && echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
#            && locale-gen \
#            && apt-get -y install --reinstall ca-certificates \
#            && apt-get clean \
#            && rm -rf /var/lib/apt/lists/* \            
#            && useradd -m -d /home/container container


ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

USER        container
ENV         HOME /home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/bash", "/entrypoint.sh"]
