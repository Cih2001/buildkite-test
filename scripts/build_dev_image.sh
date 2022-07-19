#!/bin/bash
set -o errexit

source ./scripts/config.sh

if [ -z $BUILDKITE_BUILD_NUMBER ]; then 
  TAG=dev
else
  TAG=dev-$BUILDKITE_BUILD_NUMBER
fi

docker build -t $SERVICE_NAME:$TAG -f ./dockerfiles/development/Dockerfile .
docker tag $SERVICE_NAME:$TAG $IMAGE_REGISTRY_PATH/$SERVICE_NAME:$TAG  
docker push $SERVICE_NAME:$TAG $IMAGE_REGISTRY_PATH/$SERVICE_NAME:$TAG  
