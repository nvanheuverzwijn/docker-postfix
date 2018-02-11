FROM debian:stretch-slim

ENV ENTRYPOINT_ROOT="entrypoint" \
    CONFIG_MAIN_CF=""

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      busybox-syslogd \
      postfix \
      procps \
    && rm -rf /var/lib/apt/lists/*

ADD https://github.com/kronostechnologies/docker-init-entrypoint/releases/download/1.3.0/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

COPY docker/ /

#CMD ["/usr/sbin/postfix start-fg"]
