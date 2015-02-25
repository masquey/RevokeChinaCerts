#!/bin/sh

adb push pubkey_blacklist.txt /sdcard/pubkey_blacklist.txt
adb push serial_blacklist.txt /sdcard/serial_blacklist.txt

adb shell su -c "cp /sdcard/pubkey_blacklist.txt /data/misc/keychain/pubkey_blacklist.txt"
adb shell su -c "cp /sdcard/serial_blacklist.txt /data/misc/keychain/serial_blacklist.txt"

echo "Please reboot your phone"
