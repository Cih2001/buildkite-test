#!/bin/bash
set -o errexit

source ./scripts/config.sh

if [ -z ${BUILDKITE+x} ]; then
  # it is running in the host machine.
  print "running linters"
  golangci-lint run --fix ./...
else 
  # it is triggered from pipeline.
  docker build -t $SERVICE_NAME:dev -f ./dockerfiles/development/Dockerfile .
  docker run -it $SERVICE_NAME:dev ./bin/golangci-lint run ./...
fi
