#!/bin/sh

set -e 

SECRETS_FILE=~/.secrets/.env-dev
OPT_SECRETS=

if [ -e $SECRETS_FILE ]; then
  echo "extra vars from secrets file: $SECRETS_FILE"
  OPT_SECRETS="-e \"@$SECRETS_FILE\""
else
    echo "No secrets file found at $SECRETS_FILE - Running with defaults."
fi

ansible-playbook -v -i "ansible-devstage/ansible-devstage-hostfile.ini" \
  -e "base_directory=$(pwd)/" \
  -e "@ansible-devstage/devstage-extra-vars.json" \
  $OPT_SECRETS shutdown-compose.yml
