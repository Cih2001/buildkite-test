#!/bin/bash

# e	Exit script immediately if any command returns a non-zero exit status.
# u	Exit script immediately if an undefined variable is used (for example, echo "$UNDEFINED_ENV_VAR").
# o pipefail	Ensure Bash pipelines (for example, cmd | othercmd) return a non-zero status if any of the commands fail, rather than returning the exit status of the last command in the pipeline.
set -euo pipefail

source ./scripts/config.sh
source ./.buildkite/scripts/common.sh

cat ~/.config/docker/keyfile.json | docker login -u _json_key --password-stdin https://eu.gcr.io
TAG=dev-$BUILDKITE_BUILD_NUMBER
if [ $1 == "unit" ]; then
  print 'running unit tests'
  docker run -it $IMAGE_REGISTRY_PATH/$SERVICE_NAME:$TAG go test -v -race ./...
elif [ $1 == "integration" ]; then
  print 'running integration tests'
  docker run -it $IMAGE_REGISTRY_PATH/$SERVICE_NAME:$TAG go test -v -race -tags=integration ./...
else
  exit 1
fi
