#!/bin/sh
# Generate CA-blacklist
# Android blacklists CAs by their public key hash

SOURCE_DIR=`dirname "$0"`
CERTIFICATES="$SOURCE_DIR/../Shared/Certificates/certificates.sh"

# Built-in blacklist (2015 Feb)
echo "5f3ab33d55007054bc5e3e5553cd8d8465d77c61"
echo "783333c9687df63377efceddd82efa9101913e8e"

for crt in "$@"; do
  openssl x509 -in "$SOURCE_DIR/$crt" -pubkey -noout | openssl rsa -pubin -outform DER 2>/dev/null | openssl dgst -sha1 | sed -e 's/^(stdin)= //g'
done
