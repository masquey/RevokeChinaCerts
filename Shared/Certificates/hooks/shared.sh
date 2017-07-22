#!/bin/bash

SOURCE_DIR=$(dirname "$0")
CERTIFICATES_DIR="$SOURCE_DIR/.."

for severity in High Medium Low; do
  for c_type in Root.CA Intermediate.CA SSL; do
    echo "# $c_type Certificates" | sed -e 's/\./ /g'
    echo
    for crt in $(cat "$CERTIFICATES_DIR/Severity.${severity}.${c_type}.txt"); do
      echo "${crt}.crt"
      echo "--------------------------------------------"
      echo
      openssl x509 -in "$CERTIFICATES_DIR/${crt}.crt" -noout -text -nameopt oneline,utf8,-esc_msb -certopt no_header,no_signame,no_sigdump,ext_error | sed -e '/Modulus/,/Exponent/d'
      echo
      echo
      echo
    done
    echo
  done > "$CERTIFICATES_DIR/Severity.${severity}.md"
done
