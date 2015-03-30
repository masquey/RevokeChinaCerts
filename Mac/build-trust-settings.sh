#!/bin/bash

SOURCE_DIR=$(dirname "$0")

ISSUERS="China CNNIC UniTrust Hongkong Chunghwa TAIWAN"
CERTIFICATIONS=$(ls "$SOURCE_DIR"/../Windows/Certs/Online/*.crt)

build-trust-settings () {
  FINGERPRINTS=$(for crt in $CERTIFICATIONS; do openssl x509 -in "$crt" -noout -sha1 -fingerprint | sed -e 's/^.*=//g'; done)

  TrustSettings=${1:-TrustSettings.plist}
  TrustSettingsByIssuers=$(mktemp -t TrustSettingsByIssuers.plist.XXXXXX)
  TrustSettingsByFingerprints=$(mktemp -t TrustSettingsByFingerprints.plist.XXXXXX)

  "$SOURCE_DIR/libexec/security-trust-settings-blacklist" $FINGERPRINTS "$TrustSettingsByFingerprints"
  "$SOURCE_DIR/libexec/security-trust-settings-blacklist-issuer" $ISSUERS "$TrustSettingsByIssuers"
  "$SOURCE_DIR/libexec/security-trust-settings-merge" "$TrustSettingsByFingerprints" "$TrustSettingsByIssuers" "$TrustSettings"
  /bin/rm "$TrustSettingsByIssuers" "$TrustSettingsByFingerprints"
}

build-trust-settings "$@"

