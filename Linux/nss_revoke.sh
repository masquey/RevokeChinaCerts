#!/bin/sh

DBPATH=$1
CERTS=$2


echo "Resetting CA set"
RESETS=``

certutil -d sql:${DBPATH} -L | grep -oP "NSS Certificate DB:revoke-china-certs:[^\s]+" | \
while read CERT;do
    certutil -d sql:${DBPATH} -D -n "${CERT}"
done

echo "Revoking CAs in $DBPATH/cert{8,9}.db"

for CERT in $CERTS;do
    # p,p,p: prohibit all use
    certutil -d sql:${DBPATH} -A -n "revoke-china-certs:${CERT}" -t p,p,p -i ${CERT}
done

echo "Done"
