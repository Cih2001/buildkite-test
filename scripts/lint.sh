#!/bin/sh

./bin/golangci-lint run --fix ./...
if [ $? -ne 0 ];then
  exit 1
fi
