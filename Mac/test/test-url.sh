#!/bin/bash

test-curl () {
  ERROR=$(curl --max-time 60 --silent --show-error "$1" 2>&1)

  case "$?" in
    60) # CURLE_SSL_CACERT
      echo -e "\033[0;32m✓\033[0m $1"
      return 0
      ;;
    0)
      echo -e "\033[0;31m✗\033[0m $1" >&2
      return 1
      ;;
    *)
      echo -e "\033[0;33m?\033[0m $1"
      echo -e "\033[0;33m└──\033[0m $(echo "$ERROR" | head -n 1)"
      return 2
      ;;
  esac
}

test-url () {
  PASSING=0
  FAILING=0
  SKIPPING=0

  for url in "$@"; do
    test-curl "$url" &
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

  case "$#" in
    0)
      echo "Usage: $0 [urls...]"
      ;;
    1)
      ;;
    *)
      echo
      echo -e "\033[0;32m$PASSING passing\033[0m"
      echo -e "\033[0;31m$FAILING failing\033[0m"
      echo -e "\033[0;33m$SKIPPING skipping\033[0m"
      ;;
  esac
}

trap 'kill 0' SIGINT SIGTERM

test-url "$@"

