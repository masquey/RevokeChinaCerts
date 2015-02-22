#!/bin/sh

set -e

# TODO: Explicitly distinguish between CA & EE certificates.
CA_CERTS=`ls ../Windows/Certs/*.crt`
EE_CERTS=`ls ../Windows/Certs/\[Fake\]*.crt`

# Generate a blacklist of CA cert public keys
PUBKEYS=`bash ca-blacklist.sh ${CA_CERTS} | tr '\n' ','`
# Generate a blacklist of EE cert serial numbers
SERIALS=`bash ee-blacklist.sh ${EE_CERTS} | tr '\n' ','`

echo $PUBKEYS > pubkey_blacklist.txt
echo $SERIALS > serial_blacklist.txt

echo "Generated and saved to pubkey_blacklist.txt and serial_blacklist.txt"

bash flashable.sh
