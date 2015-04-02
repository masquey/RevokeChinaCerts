#!/bin/sh

SOURCE_DIR=$(dirname "$0")

certificates () {
  for severity_level in $SEVERITY; do
    for certificate_type in $TYPE; do
      for certificate in $(cat "$SOURCE_DIR/Severity.${severity_level}.${certificate_type}.txt"); do
        if [ "$1" = "--SHA1" ]; then
          echo "$certificate"
        else
          echo "$SOURCE_DIR/${certificate}.pem"
        fi
      done
    done
  done | sort
}

certificates "$@"

