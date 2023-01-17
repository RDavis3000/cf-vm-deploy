#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    exit 1
fi

pushd generated-compose-directories/$1

echo "*** Tailing logs. ctrl-C to end ***"

docker-compose logs -f

popd
