#!/bin/bash

# Create the file and parent directories
mktouch() { mkdir -p $(dirname $1) && touch $1; }

pushd templates

find * -name 'docker-compose.yml' | while read aa 
do 

  NEWFILE=../generated-compose-directories/$aa 
  echo "Generating $NEWFILE"
  mktouch "$NEWFILE"
  
  envsubst < "$aa" > "$NEWFILE"

  # The @@ string is a special indicator that this should be a runtime-resolved env variable
  if [ $(uname) == "Darwin" ]
  then
    sed -i '' 's/@@/\$/g' "$NEWFILE"
  else 
    sed -i 's/@@/\$/g' "$NEWFILE"
  fi
done

#
# Now fixup retool configs
#

popd

pushd retool/init-retool

  ./get-retool.sh

  pushd retool-onpremise

    envsubst < ../docker.env.template > docker.env
    envsubst < ../docker-compose.yml.template > docker-compose.yml
    envsubst < ../Dockerfile.local.template > Dockerfile.local

  popd 
popd
