FROM consul:v0.7.0

MAINTAINER David Steiman https://github.com/xetys
MAINTAINER Pierre Besson https://github.com/PierreBesson

RUN apk --update add nodejs git openssh bash inotify-tools jq && \
    rm -rf /var/cache/apk/* && \
    npm install -g git2consul@0.12.12 && \
    mkdir -p /etc/git2consul.d

ADD run-consul-with-config.sh /
VOLUME /config

ENV CONFIG_MODE=filesystem
ENV INIT_SLEEP_SECONDS=5
ENV CONSUL_URL=localhost
ENV CONSUL_PORT=8500
ENV CONFIG_DIR=/config

CMD ["/run-consul-with-config.sh"]
