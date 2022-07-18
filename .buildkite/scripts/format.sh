#!/bin/sh

docker build -t order:dev -f ./dockerfiles/development/Dockerfile .
docker run -it order:dev ./scripts/lint.sh
if [ $? -ne 0 ]; then
  exit 1
fi

