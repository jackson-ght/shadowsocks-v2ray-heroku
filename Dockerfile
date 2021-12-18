FROM debian:sid

# Add curl to automatically restart the app at a specific time using Heroku Scheduler

RUN set -ex\
    && apt update -y \
    && apt upgrade -y \
    && apt install -y wget curl unzip qrencode\
    && apt install -y shadowsocks-libev\
    && apt install -y nginx\
    && apt autoremove -y

COPY wwwroot.tar.gz /wwwroot/wwwroot.tar.gz
COPY conf/ /conf
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

CMD /entrypoint.sh
