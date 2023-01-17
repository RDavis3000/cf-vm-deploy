#!/bin/bash

set -e

if [ -z ${RETOOL_ENV+x} ]; then
  echo "No RETOOL_ENV variable set. Exiting."
  exit
else
  echo "Local environment is set to: $RETOOL_ENV"
  export RETOOL_LICENSE_KEY="${RETOOL_LICENSE_KEY:-none}"
  echo "Using RETOOL_LICENSE_KEY=$RETOOL_LICENSE_KEY (\$export RETOOL_LICENSE_KEY=whatever if this is wrong)"
  # envsubst < docker.env.template > retool-onpremise/docker.env
  pushd retool-onpremise

  docker-compose build --pull 
  docker-compose pull && docker-compose up -d
  docker image prune -a -f

  popd
fi

