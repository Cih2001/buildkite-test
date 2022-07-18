#!/bin/bash
set -o errexit;

if [ $1 == "unit" ]; then
  docker build -t order:dev -f ./dockerfiles/development/Dockerfile .
  docker run -it order:dev make tests-unit
elif [ $1 == "integration" ]; then
  docker build -t order:dev -f ./dockerfiles/development/Dockerfile .
  docker run -it order:dev make tests-integration
else
  exit 1
fi
