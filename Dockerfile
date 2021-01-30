# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Source Engine
# Minimum Panel Version: 0.6.0
# ----------------------------------
#FROM        debian:buster-slim
FROM        ubuntu:bionic

ENV         DEBIAN_FRONTEND noninteractive

# Install Dependencies
RUN         dpkg --add-architecture i386 \
            && apt-get update \
            && apt-get upgrade -y \
#            && apt-get -y install ca-certificates curl g++ gcc tmux iproute2 lib32gcc1 libstdc++5 libstdc++5:i386 lib32z1 libncurses5 libncursesw5 libprocps7 libtinfo5 libxcursor1 libxext6 libxft2 libxft2:i386 libxinerama1 locales net-tools procps wget gdebi-core software-properties-common gdb lib32stdc++ libtinfo5:i386 libtinfo5 libncurses5:i386 libcurl3-gnutls:i386 libtinfo5:i386 libncurses5:i386 libjpeg62:i386 libxext6:i386 libxinerama1:i386 libstdc++6:i386 libncursesw5:i386 libxcursor1:i386 \
            && apt-get -y install --no-install-recommends \
#                        wget ca-certificates tar gcc g++ lib32gcc1 libgcc1 libcurl4-gnutls-dev:i386 libssl1.1 libcurl4:i386 libtinfo5 lib32z1 lib32stdc++6 libncurses5:i386 libcurl3-gnutls:i386 gdb libsdl1.2debian libfontconfig net-tools locales \
#                        ca-certificates build-essential cpp curl procps wget locales g++ gcc tmux lib32gcc1 libtinfo5 libncurses5 libtinfo5:i386 libncursesw5 libstdc++5 libstdc++5:i386 libxft2 libxft2:i386 libncurses5:i386 libcurl3-gnutls:i386 libjpeg62:i386 libxext6:i386 libxinerama1:i386 libstdc++6:i386 libncursesw5:i386 libxcursor1:i386 lib32gcc1 ca-certificates gcc libstdc++5:i386 libstdc++6:i386 libgcc1:i386 zlib1g:i386 libncurses5:i386 \
                        wget lib32ncurses5 lib32gcc1 lib32stdc++6 lib32tinfo5 ca-certificates screen tar bzip2 gzip unzip gdb net-tools locales \
            && touch /etc/locale.gen \
            && echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
            && locale-gen \
            && apt-get -y install --reinstall ca-certificates \
            && apt-get clean \
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
