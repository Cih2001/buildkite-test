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
  if [ $1 == "unit" ]; then
    print 'running unit tests'
    docker build -t order:dev -f ./dockerfiles/development/Dockerfile .
    docker run -it order:dev go test -v -race ./...
  elif [ $1 == "integration" ]; then
    print 'running integration tests'
    docker build -t order:dev -f ./dockerfiles/development/Dockerfile .
    docker run -it order:dev go test -v -race -tags=integration ./...
  else
    exit 1
  fi
fi

