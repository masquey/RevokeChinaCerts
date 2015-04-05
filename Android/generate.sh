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

echo "Generating Configurations"
# Generate a blacklist of CA cert public keys
PUBKEYS=`"$SOURCE_DIR/ca-blacklist.sh" ${CA_CERTS} | sort | tr '\n' ','`
# Generate a blacklist of EE cert serial numbers
SERIALS=`"$SOURCE_DIR/ee-blacklist.sh" ${EE_CERTS} | sort | tr '\n' ','`

echo "Writing Configurations"
echo $PUBKEYS > pubkey_blacklist.txt
echo $SERIALS > serial_blacklist.txt

echo "Generated and saved to pubkey_blacklist.txt and serial_blacklist.txt"

echo "Building Flashable Zip"
bash "$SOURCE_DIR/flashable.sh"

echo "Done!"
