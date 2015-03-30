#!/bin/bash
#
# Author: @ntkme
#

PASSING=0
FAILING=0
SKIPPING=0

trap 'kill 0' SIGINT SIGTERM

for url in $(cat "${1:-$(dirname "$0")/test-url-list.txt}"); do
  "$(dirname "$0")/test-url.sh" "$url" &
done

for job in $(jobs -p); do
  wait "$job"
  case "$?" in
    0)
      PASSING=$(( $PASSING + 1 ))
      ;;
    1)
      FAILING=$(( $FAILING + 1 ))
      ;;
    *)
      SKIPPING=$(( $SKIPPING + 1 ))
      ;;
  esac
done

echo
echo -e "\033[0;32m$PASSING passing\033[0m"
echo -e "\033[0;31m$FAILING failing\033[0m"
echo -e "\033[0;33m$SKIPPING skipping\033[0m"
