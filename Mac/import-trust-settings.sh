#!/bin/bash
#
# Author: @ntkme
#

pushd "$(dirname "$0")" >/dev/null

PATH=$PATH:$PWD/bin

security trust-settings-export -d TrustSettingsExported.plist 2>/dev/null
security-trust-settings-merge TrustSettingsExported.plist TrustSettings.plist TrustSettings.plist
/bin/rm TrustSettingsExported.plist 2>/dev/null
/usr/bin/sudo -p "Please enter %u's password:" security trust-settings-import -d TrustSettings.plist

popd >/dev/null
