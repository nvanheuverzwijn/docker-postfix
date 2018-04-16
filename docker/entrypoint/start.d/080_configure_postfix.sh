#!/bin/bash

if [[ -n "$POSTFIX_CONFIG_MAIN_CF" ]]; then
  echo "Using environment variable 'POSTFIX_CONFIG_MAIN_CF' as content for '/etc/postfix/main.cf'"
  echo -n "$POSTFIX_CONFIG_MAIN_CF" > /etc/postfix/main.cf
fi

if [[ -n "$POSTFIX_CONFIG_MASTER_CF" ]]; then
  echo "Using environment variable 'POSTFIX_CONFIG_MASTER_CF' as content for '/etc/postfix/master.cf'"
  echo -n "$POSTFIX_CONFIG_MASTER_CF" > /etc/postfix/master.cf
fi

if [[ -n "$POSTFIX_VIRTUAL_MAILBOX_DOMAINS_CF" ]]; then
  echo "Using environment variable 'POSTFIX_VIRTUAL_MAILBOX_DOMAINS_CF' as content for '/etc/postfix/virtual_mailbox_domains.cf'"
  echo -n "$POSFIX_VIRTUAL_MAILBOX_DOMAINS_CF" > /etc/postfix/virtual_mailbox_domains.cf
fi

if [[ -n "$POSTFIX_VIRTUAL_MAILBOX_MAPS_CF" ]]; then
  echo "Using environment variable 'POSTFIX_VIRTUAL_MAILBOX_MAPS_CF' as content for '/etc/postfix/virtual_mailbox_maps.cf'"
  echo -n "$POSTFIX_VIRTUAL_MAILBOX_MAPS_CF" > /etc/postfix/virtual_mailbox_maps.cf
fi

if [[ -n "$POSTFIX_VIRTUAL_ALIAS_MAPS_CF" ]]; then
  echo "Using environment variable 'POSTFIX_VIRTUAL_ALIAS_MAPS_CF' as content for '/etc/postfix/virtual_alias_maps.cf'"
  echo -n "$POSTFIX_VIRTUAL_ALIAS_MAPS_CF" > /etc/postfix/virtual_alias_maps.cf
fi
