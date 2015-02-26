#!/bin/sh

DBPATH=$1
CERTS=$2

echo "Revoking CAs in $DBPATH/cert9.db"

for CERT in $CERTS;do
    # p,p,p: prohibit all use
    certutil -d sql:${DBPATH} -A -n "${CERT}" -t p,p,p -i ${CERT}
done

echo "Done"
