#!/bin/bash
set -o errexit

source ./scripts/config.sh
echo $SERVICE_NAME

if [ -z ${BUILDKITE+x} ]; then
  # it is running in the host machine.
  golangci-lint run --fix ./...
else 
  # it is triggered from pipeline.
  docker build -t $SERVICE_NAME:dev -f ./dockerfiles/development/Dockerfile .
  docker run -it $SERVICE_NAME:dev ./bin/golangci-lint run ./...
fi
