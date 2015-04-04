#!/bin/bash

SOURCE_DIR=$(dirname "$0")

pushd "$SOURCE_DIR" >/dev/null

for crt in $(ls *crt); do
  mv "$crt" "$(openssl x509 -in "$crt" -noout -sha1 -fingerprint | sed -e 's/^.*=//g' -e 's/://g').crt"
done

for severity in High Medium Low; do
  for c_type in Root.CA Intermediate.CA SSL; do
    echo "# $c_type Certificates" | sed -e 's/\./ /g'
    echo
    for crt in $(cat "Severity.${severity}.${c_type}.txt"); do
      echo "${crt}.crt"
      echo "--------------------------------------------"
      echo
      openssl x509 -in "${crt}.crt" -noout -text -nameopt oneline,utf8,-esc_msb -certopt no_header,no_validity,no_sigdump,ext_error | sed -e '/Modulus/,/Exponent/d'
      echo
      echo
      echo
    done
    echo
  done > "Severity.${severity}.md"
done

popd >/dev/null
