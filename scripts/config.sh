#!/usr/bin/env bash
SERVICE_NAME=order


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
