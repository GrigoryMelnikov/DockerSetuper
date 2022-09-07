#!/bin/bash

! [ $# -eq 1 ] \
  && echo Wrong number of arguments provided  \
  && echo "Please use: exportImage '<Source Name>' "\
  && exit

HOME="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && cd .. && pwd )"
IMAGE="$(cat docker-compose.yaml | grep image | cut -d: -f2-)"
TARGET=$1
IMAGE_DIR="Images/"
EXPORT_DIR="${IMAGE_DIR}/${TARGET}"

# return to parent folder
cd "${HOME}" && set -e

echo Loading Image $IMAGE from $EXPORT_DIR/$TARGET.

docker load --input "${EXPORT_DIR}/${TARGET}.tar.gz"

cp "${IMAGE_DIR}/${TARGET}/docker-compose.yaml" "$HOME/docker-compose.yaml"

docker-compose -p "py3_base" up --no-build
