#!/bin/bash

# e	Exit script immediately if any command returns a non-zero exit status.
# u	Exit script immediately if an undefined variable is used (for example, echo "$UNDEFINED_ENV_VAR").
# o pipefail	Ensure Bash pipelines (for example, cmd | othercmd) return a non-zero status if any of the commands fail, rather than returning the exit status of the last command in the pipeline.
set -euo pipefail

source ./scripts/config.sh

TAG=dev-$BUILDKITE_BUILD_NUMBER
cat ~/.config/docker/keyfile.json | docker login -u _json_key --password-stdin https://eu.gcr.io

docker build -t $SERVICE_NAME:$TAG -f ./dockerfiles/development/Dockerfile .
docker tag $SERVICE_NAME:$TAG $IMAGE_REGISTRY_PATH/$SERVICE_NAME:$TAG  
docker push $IMAGE_REGISTRY_PATH/$SERVICE_NAME:$TAG  
