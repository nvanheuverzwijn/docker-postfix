#!/bin/bash

if [[ -n "$POSTFIX_CONFIG_MAIN_CF" ]]; then
  echo "Using environment variable 'POSTFIX_CONFIG_MAIN_CF' as content for '/etc/postfix/main.cf'"
  echo -n "$POSTFIX_CONFIG_MAIN_CF" > /etc/postfix/main.cf
fi

if [[ -n "$POSTFIX_CONFIG_MASTER_CF" ]]; then
  echo "Using environment variable 'POSTFIX_CONFIG_MASTER_CF' as content for '/etc/postfix/master.cf'"
  echo -n "$POSTFIX_CONFIG_MASTER_CF" > /etc/postfix/master.cf
fi
