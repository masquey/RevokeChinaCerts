#!/bin/bash
# Linux updater script

SOURCE_DIR=`dirname "$0"`
CERTIFICATES="$SOURCE_DIR/../certificates.sh"


function _generate {
	rm "$2"
	(SEVERITY="$1" TYPE="Root.CA Intermediate.CA SSL" "$CERTIFICATES" \
	| while read cert; do
		paste <(openssl x509 -sha1 -fingerprint -noout -in $cert) <(git ls-tree --full-name --name-only HEAD $cert)
	done) | sort > "$2"
}

DEST_DIR="$SOURCE_DIR/../../../Linux"
_generate "High" "$DEST_DIR/certsum_base_sorted.txt"
_generate "High Medium" "$DEST_DIR/certsum_extended_sorted.txt"
_generate "High Medium Low" "$DEST_DIR/certsum_all_sorted.txt"
