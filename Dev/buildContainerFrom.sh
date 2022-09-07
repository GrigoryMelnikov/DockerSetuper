#!/bin/bash

# TODO: add --help
# args Explanation

HOME="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && cd .. && pwd )"
DOCKERFILE_DIR="Dockerfiles/"
DOCKER_COMPOSE_DIR="Docker-Compose/"

! [ $# -eq 2 ] \
  && echo Wrong number of arguments provided  \
  && echo "Please use: buildContainerFrom '<Your Dockerfile>' '<Your docker-compose.yaml>'"\
  && exit

DOCKERFILE=$1       # First argumenet
DOCKER_COMPOSE=$2   # Second argument

# interrupt execution and exit on error
cd $HOME && set -e

echo File $DOCKERFILE_DIR$DOCKERFILE will be converted into Dockerfile...
echo File $DOCKER_COMPOSE_DIR$DOCKER_COMPOSE will be converted into docker-compose.yaml
echo Converting $DOCKERFILE_DIR$DOCKERFILE into Dockerfile.

# Save 1st argument (Dockerfile) locally as Dockerfile
cp -f $DOCKERFILE_DIR$DOCKERFILE 'Dockerfile'

echo Converting $DOCKER_COMPOSE_DIR$DOCKER_COMPOSE into docker-compose.yaml

cp -f $DOCKER_COMPOSE_DIR$DOCKER_COMPOSE 'docker-compose.yaml'

echo Building Docker Container via 'docker-compose' from 'docker-compose.yaml' and 'Dockerfile'

docker-compose -p "py3_base" up --build
# docker-compose build
