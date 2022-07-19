#!/bin/bash
set -o errexit;

source ./scripts/config.sh

if [ -z ${BUILDKITE+x} ]; then
  # it is running in the host machine.
  print 'running unit tests'
  go test -v -race ./...
  print 'running integration tests'
  go test -v -race -tags=integration ./...
else
  # it is triggered from pipeline.
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
fi

