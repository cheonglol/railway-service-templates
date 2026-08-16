FROM lscr.io/linuxserver/webtop:latest

RUN apk add --no-cache \
    curl \
    wget \
    net-tools \
    iputils \
    bind-tools \
    vim \
    htop \
    jq \
    postgresql-client \
    firefox \
    tzdata

ENV PUID=0
ENV PGID=0
ENV TZ=Asia/Singapore

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 3000
