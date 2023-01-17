#!/bin/sh

set -ex 


# DEV ENV ^^ 

SECRETS_FILE=~/.secrets/.env-dev


if [ -e $SECRETS_FILE ]; then
  echo "Moving screts file into position: $SECRETS_FILE"
  cp $SECRETS_FILE compose-projects/creditcounter-hasura/.env
  cp $SECRETS_FILE compose-projects/metabase/.env
else
  echo "No secrets file found at $SECRETS_FILE - Running with defaults."
fi

cp  ~/.secrets/retool-devstage-docker.env compose-projects/retool-onprem/devstage-docker.env

ansible-playbook -vv -i "ansible-devstage/ansible-devstage-hostfile.ini" \
  -e "base_directory=$(pwd)/" \
  -e "registry_password=$DOCKER_REGISTRY_PASSWORD" \
  -e "registry_name=$DOCKER_REGISTRY_NAME" \
  -e "@ansible-devstage/devstage-extra-vars.json" \
  playbook.yml
