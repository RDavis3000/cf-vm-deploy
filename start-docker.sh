#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    exit 1
fi

#
# special handling for retool
#
if [ "$1" == "retool" ]
  then
    if [ -z ${RETOOL_ENV+x} ]; then echo "No RETOOL_ENV variable set. Have you source-d the environment variables? Exiting." ; exit ; fi 
    pushd retool/init-retool
    ./start-retool.sh
    popd
    exit
fi


pushd generated-compose-directories/$1

if [ ".$2" == ".pull" ]
  then
    echo "setting --force-recreate"
    docker-compose rm -s
    docker-compose pull
    docker-compose up --force-recreate -d
  else
    docker-compose up -d
fi
popd
