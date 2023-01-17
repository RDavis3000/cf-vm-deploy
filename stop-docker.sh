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
    ./stop-retool.sh
    popd
    exit
fi
#
# Everything else is a generated compose config
#
pushd generated-compose-directories/$1

docker-compose logs
docker-compose down 

popd
