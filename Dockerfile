FROM debian:stretch-slim

ENV ENTRYPOINT_ROOT="entrypoint" \
    POSTFIX_CONFIG_MAIN_CF="" \
    POSTFIX_CONFIG_MASTER_CF="" \
    POSTFIX_VIRTUAL_MAILBOX_DOMAINS_CF="" \
    POSTFIX_VIRTUAL_MAILBOX_MAPS_CF="" \
    POSTFIX_VIRTUAL_ALIAS_MAPS_CF=""

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      busybox-syslogd \
      ca-certificates \
      postfix \
      postfix-mysql \
      procps \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -u 5000 -U -m -d /var/mail --groups mail vmail

ADD https://github.com/kronostechnologies/docker-init-entrypoint/releases/download/1.3.0/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

EXPOSE 25 465 587

COPY docker/ /
