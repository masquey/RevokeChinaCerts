#!/bin/bash

SOURCE_DIR=$(dirname "$0")
CERTIFICATES="$SOURCE_DIR/../Shared/Certificates/certificates.sh"

build-trust-settings () {
  case $MODE in
    essential)
      FINGERPRINTS=$(SEVERITY="High" TYPE="Root.CA Intermediate.CA SSL" "$CERTIFICATES" --SHA1)
      ;;
    strict)
      FINGERPRINTS=$(SEVERITY="High Medium Low" TYPE="Root.CA Intermediate.CA SSL" "$CERTIFICATES" --SHA1)
      ;;
    *)
      FINGERPRINTS=$(SEVERITY="High Medium" TYPE="Root.CA Intermediate.CA SSL" "$CERTIFICATES" --SHA1)
  esac

  TrustSettings=${1:-TrustSettings.plist}
  TrustSettingsByFingerprints=$(mktemp -t TrustSettingsByFingerprints.plist.XXXXXX)

  "$SOURCE_DIR/libexec/security-trust-settings-blacklist" $FINGERPRINTS "$TrustSettingsByFingerprints"
  "$SOURCE_DIR/libexec/security-trust-settings-merge" "$TrustSettingsByFingerprints" "$TrustSettingsByIssuers" "$TrustSettings"
  /bin/rm "$TrustSettingsByFingerprints"
}

build-trust-settings "$@"

