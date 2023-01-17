#!/bin/bash

#set -e 

pushd build-space

#
# Get creditcounter
#

if [ ! -d "creditcounter" ]; then
  git clone git@gitlab.com:cftech/creditcounter.git
fi

pushd creditcounter
git checkout master
git pull

#
# Only rebuild the base if it's not present - save a lot of time
#
BASE_BUILT=$(docker images -q cftech/creditcounter-base | wc -l)
if [ $BASE_BUILT -lt 1 ]; then
  echo "*** BUILDING cftech/creditcounter-base because it's not in the local registry. Remove the base image if you want to force the base to rebuild."
  docker build . -t cftech/creditcounter-base -f base.Dockerfile
else
    echo "*** Not building cftech/creditcounter-base because it's already in the local registry (This is a time-saving measure - if you want to force rebuild, then *docker rmi* the image)"
fi

docker build . -t cftech/creditcounter -f plumber.Dockerfile

popd

# pop build-space
popd

exit 0
