FROM debian:bookworm

ENV DEBIAN_FRONTEND=noninteractive

# Instala dependencias necesarias
RUN dpkg --add-architecture i386 && \
    apt update && \
    apt install -y \
        lib32gcc-s1 \
        lib32stdc++6 \
        ca-certificates \
        curl \
        wget \
        unzip \
        tar \
        screen

# Crea carpetas de trabajo
RUN mkdir -p /steamcmd /l4d2
WORKDIR /steamcmd

# Descarga SteamCMD
RUN curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -

# Copia el script de inicio
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

VOLUME ["/l4d2"]
WORKDIR /l4d2

# Puertos típicos del servidor
EXPOSE 27015/udp 27005/udp 27020/udp

ENTRYPOINT ["/entrypoint.sh"]
