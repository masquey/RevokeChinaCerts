#!/bin/bash
#
# Author: @ntkme
#

ERROR=$(curl --max-time 60 --silent --show-error "$1" 2>&1)

case "$?" in
  0)
    echo -e "\033[0;31m✗\033[0m $1" >&2
    exit 1
    ;;
  60) # CURLE_SSL_CACERT
    echo -e "\033[0;32m✓\033[0m $1"
    exit 0
    ;;
  *)
    echo -e "\033[0;33m?\033[0m $1"
    echo -e "\033[0;33m└──\033[0m $(echo "$ERROR" | head -n 1)"
    exit 2
    ;;
esac
