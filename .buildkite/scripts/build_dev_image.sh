#!/bin/bash

# e	Exit script immediately if any command returns a non-zero exit status.
# u	Exit script immediately if an undefined variable is used (for example, echo "$UNDEFINED_ENV_VAR").
# o pipefail	Ensure Bash pipelines (for example, cmd | othercmd) return a non-zero status if any of the commands fail, rather than returning the exit status of the last command in the pipeline.
set -euo pipefail

source ./.buildkite/scripts/common.sh

login_docker

TAG=dev-$BUILDKITE_BUILD_NUMBER
print "building image $TAG"
docker build -t $SERVICE_NAME:$TAG -f ./dockerfiles/development/Dockerfile .
docker tag $SERVICE_NAME:$TAG $IMAGE_REGISTRY_PATH/$SERVICE_NAME:$TAG  
print "pushing image $TAG to gcp container registry"
docker push $IMAGE_REGISTRY_PATH/$SERVICE_NAME:$TAG  
