#!/bin/bash

SOURCE_DIR=$(dirname "$0")

pushd "$SOURCE_DIR" >/dev/null

for crt in $(ls *.crt); do
  sha1_crt="$(openssl x509 -in "$crt" -noout -sha1 -fingerprint | sed -e 's/^.*=//g' -e 's/://g').crt"
  if [ "$crt" != "$sha1_crt" ]; then
    mv "$crt" "$sha1_crt"
    echo "renamed: $crt -> $sha1_crt"
  fi
done

popd >/dev/null
