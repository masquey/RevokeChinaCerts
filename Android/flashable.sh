#!/bin/sh
# Generate flashable

GEN_ZIP='flashable.zip'

mkdir -p flashable/data/misc/keychain

test -f $GEN_ZIP && rm $GEN_ZIP

cp pubkey_blacklist.txt flashable/data/misc/keychain
cp serial_blacklist.txt flashable/data/misc/keychain
(cd flashable; zip ../$GEN_ZIP -r *)
