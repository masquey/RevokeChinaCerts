#!/bin/sh
# Android blacklists EE by serial number

# Builtin Blacklist (2015 Feb)
echo "827"
echo "864"

for file in "$@";do
    keytool -printcert -file ${file} | grep Serial \
        | awk -F ':' '{print $2}' | tr -d '[] ' 
done
