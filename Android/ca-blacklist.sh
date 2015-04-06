#!/bin/sh
# Generate CA-blacklist
# Android blacklists CAs by their public key hash

SOURCE_DIR=`dirname "$0"`
CERTIFICATES="$SOURCE_DIR/../Shared/Certificates/certificates.sh"

# OpenSSL 0.9.8 does not have pkey command
openssl_pkey () {
  stdin=`cat`
  for pkey in pkey rsa dsa ec; do
    stdout=`echo "$stdin" | command openssl "$pkey" "$@" 2>/dev/null`
    if test -n "$stdout"; then
      break
    fi
  done
  echo "$stdin" | command openssl "$pkey" "$@"
}

# Built-in blacklist (2015 Feb)
echo "5f3ab33d55007054bc5e3e5553cd8d8465d77c61"
echo "783333c9687df63377efceddd82efa9101913e8e"

for crt in "$@"; do
  openssl x509 -in "$SOURCE_DIR/$crt" -pubkey -noout | openssl_pkey -pubin -outform DER 2>/dev/null | openssl dgst -sha1 | sed -e 's/^(stdin)= //g'
done
