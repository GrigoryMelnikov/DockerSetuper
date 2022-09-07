#!/bin/bash

! [ $# -eq 1 ] \
  && echo Wrong number of arguments provided  \
  && echo "Please use: exportImage '<Target Name>'"\
  && exit

HOME="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && cd .. && pwd )"
IMAGE="$(cat docker-compose.yaml | grep image | cut -d: -f2-)"
TARGET=$1
IMAGE_DIR="Images"
EXPORT_DIR="${IMAGE_DIR}/${TARGET}"

# return to parent folder
cd "${HOME}" && set -e

[[ -d $EXPORT_DIR ]] \
  && rm -rf $EXPORT_DIR/* \
  || mkdir $EXPORT_DIR

echo "Save Image ${IMAGE} into ${EXPORT_DIR}/${TARGET}.tar.gz"

docker save --output "${EXPORT_DIR}/${TARGET}.tar.gz" ${IMAGE}

# Copy Build references to Image so it could be recreatable,
# since there is no registry.
sed 's/build/# build/' docker-compose.yaml > "${EXPORT_DIR}/docker-compose.yaml"
cp Dockerfile ${EXPORT_DIR}/Dockerfile

cp "$HOME/Dev/src/HOW_TO_USE_SAVED_IMAGE.md" $EXPORT_DIR
