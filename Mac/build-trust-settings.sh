#!/bin/bash
#
# Generate TrustSettings.plist using security-trust-settings-tools
# See: https://github.com/ntkme/security-trust-settings-tools
#
# Author: @ntkme
#

pushd "$(dirname "$0")" >/dev/null

PATH=$PATH:$PWD/bin

ISSUERS="China CNNIC UniTrust Hongkong Chunghwa TAIWAN"
CERTIFICATIONS="$(ls ../Windows/Certs/Online/*.crt)"

FINGERPRINTS="$(for crt in $CERTIFICATIONS; do openssl x509 -in "$crt" -noout -sha1 -fingerprint | sed -e 's/^.*=//g'; done)"

security-trust-settings-blacklist-issuer $ISSUERS TrustSettings_Issuers.plist
security-trust-settings-blacklist $FINGERPRINTS TrustSettings_Fingerprints.plist
security-trust-settings-merge TrustSettings_Fingerprints.plist TrustSettings_Issuers.plist TrustSettings.plist
/bin/rm TrustSettings_*.plist

popd >/dev/null
