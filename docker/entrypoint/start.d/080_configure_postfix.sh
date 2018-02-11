#!/bin/bash

if [[ -n "$POSTFIX_CONFIG_MAIN_CF" ]]; then
  echo "Using environment variable 'POSTFIX_CONFIG_MAIN_CF' as content for '/etc/postfix/main.cf'"
  echo -n "$POSTFIX_CONFIG_MAIN_CF" > /etc/postfix/main.cf
fi
