#!/bin/sh
# Generate CA-blacklist
# Android blacklists CAs by their public key hash

# Built-in blacklist (2015 Feb)
echo "5f3ab33d55007054bc5e3e5553cd8d8465d77c61"
echo "783333c9687df63377efceddd82efa9101913e8e"

for file in "$@";do
    openssl x509 -inform pem -in ${file} -pubkey -noout \
        | sed '$d' | sed '1d' | base64 -d | sha1sum | awk '{print $1}'
done
