#!/bin/sh

SOURCE_DIR=`dirname "$0"`
CERTIFICATES="$SOURCE_DIR/../Shared/Certificates/certificates.sh"

if [ ${1:-extended} = 'all' ];then
    echo "Generating ALL CRL set"
    CA_CERTS=`SEVERITY="High Medium Low" TYPE="Root.CA Intermediate.CA" "$CERTIFICATES"`
    EE_CERTS=`SEVERITY="High Medium Low" TYPE="SSL" "$CERTIFICATES"`
elif [ ${1:-extended} = 'extended' ];then
    echo "Generating EXTENDED CRL set"
    CA_CERTS=`SEVERITY="High Medium" TYPE="Root.CA Intermediate.CA" "$CERTIFICATES"`
    EE_CERTS=`SEVERITY="High Medium" TYPE="SSL" "$CERTIFICATES"`
elif [ ${1:-extended} = 'restore' ];then
    echo "Generating RESTORE CRL set"
    CA_CERTS=''
    EE_CERTS=''
else
    echo "Generating Basic CRL set"
    CA_CERTS=`SEVERITY="High" TYPE="Root.CA Intermediate.CA" "$CERTIFICATES"`
    EE_CERTS=`SEVERITY="High" TYPE="SSL" "$CERTIFICATES"`
fi

CERTS="$CA_CERTS $EE_CERTS"
"$SOURCE_DIR/nss_revoke.sh" ${2:-~/.pki/nssdb} "${CERTS}"
"$SOURCE_DIR/cac_revoke.sh" ${1:-extended}
