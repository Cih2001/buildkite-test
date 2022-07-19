#!/bin/bash
set -o errexit

source ./scripts/config.sh

if [ -z $BUILDKITE_BUILD_NUMBER ]; then 
  TAG=dev
else
  TAG=dev-$BUILDKITE_BUILD_NUMBER
fi

cat ~/.config/docker/keyfile.json | docker login -u _json_key --password-stdin https://eu.gcr.io

docker build -t $SERVICE_NAME:$TAG -f ./dockerfiles/development/Dockerfile .
docker tag $SERVICE_NAME:$TAG $IMAGE_REGISTRY_PATH/$SERVICE_NAME:$TAG  
docker push $IMAGE_REGISTRY_PATH/$SERVICE_NAME:$TAG  
