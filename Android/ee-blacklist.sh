#!/bin/sh
# Android blacklists EE by serial number

SOURCE_DIR=`dirname "$0"`
CERTIFICATES="$SOURCE_DIR/../Shared/Certificates/certificates.sh"

# Builtin Blacklist (2015 Feb)
echo "827"
echo "864"

for crt in "$@";do
  openssl x509 -in "$SOURCE_DIR/$crt" -noout -serial | awk -F '=' '{print tolower($2)}'
done
