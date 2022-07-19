#!/usr/bin/env bash

source ./scripts/config.sh

# Colors
RESET="\e[0m"
COLOR_DEFAULT="\e[39m"
COLOR_WHITE="\e[97m"
COLOR_GREEN="\e[32m"
COLOR_BLUE="\e[34m"
COLOR_RED="\e[31m"
COLOR_YELLOW="\e[33m"
TEXT_BOLD="\e[1m"
TEXT_INVERSE="\e[7m"
TEXT_DEFAULT="\e[27m"

function print(){
  printf "${TEXT_INVERSE}${COLOR_WHITE} %10b ${COLOR_GREEN} %-75b ${COLOR_WHITE}${COLOR_DEFAULT}${RESET}\n" "$(basename "$0")" "$1"
}

function login_docker() {
  print "logging in into gcp container registry"
  cat ~/.config/docker/keyfile.json | docker login -u _json_key --password-stdin https://$IMAGE_REGISTRY_BASE
}
