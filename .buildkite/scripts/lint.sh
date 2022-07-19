#!/bin/bash
set -o errexit

source ./scripts/config.sh
source ./.buildkite/scripts/common.sh

if [ -z ${BUILDKITE+x} ]; then
  # it is running in the host machine.
  print "running linters"
  golangci-lint run --fix ./...
else 
  # it is triggered from pipeline.
  cat ~/.config/docker/keyfile.json | docker login -u _json_key --password-stdin https://eu.gcr.io
  TAG=dev-$BUILDKITE_BUILD_NUMBER
  docker run -it $IMAGE_REGISTRY_PATH/$SERVICE_NAME:$TAG ./bin/golangci-lint run ./...
fi
