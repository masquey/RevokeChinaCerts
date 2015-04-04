#!/bin/bash

SOURCE_DIR=$(dirname "$0")

if [ "$(uname)" = "Darwin" ]; then
  "$SOURCE_DIR/../../../Mac/build-trust-settings.sh" "$SOURCE_DIR/../../../Mac/TrustSettings.plist"
fi
