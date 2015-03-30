#!/bin/bash

SOURCE_DIR=$(dirname "$0")

import-trust-settings () {
  TrustSettings=${1:-"$SOURCE_DIR/TrustSettings.plist"}
  TrustSettingsExported=$(mktemp -t TrustSettingsExported.plist.XXXXXX)
  TrustSettingsMerged=$(mktemp -t TrustSettingsMerged.plist.XXXXXX)

  security trust-settings-export -d "$TrustSettingsExported" 2>/dev/null
  "$SOURCE_DIR/libexec/security-trust-settings-merge" "$TrustSettingsExported" "$TrustSettings" "$TrustSettingsMerged"
  /bin/rm "$TrustSettingsExported"
  /usr/bin/sudo -p "Please enter %u's password:" security trust-settings-import -d "$TrustSettingsMerged"
  /bin/rm "$TrustSettingsMerged"
}

import-trust-settings "$@"

