#!/bin/sh

set -ex 


SECRETS_FILE=~/.secrets/.env

if [ -e $SECRETS_FILE ]; then
  echo "Moving screts file into position: $SECRETS_FILE"
  cp ~/.secrets/.env compose-projects/metabase/.env
else
  echo "No secrets file found at $SECRETS_FILE - Running with defaults."
fi

ansible-playbook -vv -i "ansible-prod/ansible-production-hostfile.ini" \
  -e "base_directory=$(pwd)/" \
  -e "registry_password=$DOCKER_REGISTRY_PASSWORD" \
  -e "registry_name=$DOCKER_REGISTRY_NAME" \
  -e "@ansible-prod/prod-extra-vars.json" \
  metabase-playbook.yml
