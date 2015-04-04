#!/bin/sh

SOURCE_DIR=$(dirname "$0")
# Default to all if not specified
TYPE=${TYPE:-'SSL Intermediate.CA Root.CA'}
SEVERITY=${SEVERITY:-'High Medium Low'}

certificates () {
  for severity_level in $SEVERITY; do
    for certificate_type in $TYPE; do
      for certificate in $(cat "$SOURCE_DIR/Severity.${severity_level}.${certificate_type}.txt"); do
        if [ "$1" = "--SHA1" ]; then
          echo "$certificate"
        else
          echo "$SOURCE_DIR/${certificate}.crt"
        fi
      done
    done
  done | sort
}

certificates "$@"

