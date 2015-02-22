#!/bin/sh
# Generate flashable

GEN_ZIP='flashable.zip'

mkdir -p flashable/data/misc/keychain
cp pubkey_blacklist.txt flashable/data/misc/keychain
cp serial_blacklist.txt flashable/data/misc/keychain
(cd flashable; zip ../$GEN_ZIP -r *)
