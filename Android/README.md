Android Certificates Blacklisting
=====================================================

This tool generates flashable zip to use with custom recovery on an 
Android 4.1+ device.

A Chinese version at (https://github.com/chengr28/RevokeChinaCerts/blob/master/Android/README_zhCN.md).

## Introduction

This utility blacklists CA and EE certificates.

## Usage -- Use prebuilt configurations (Recommended)

### With root access

Assuming you have root access on your phone, `cd` into the folder whose
name corresponds to the config you want (RESTORE, ALL, EXTENDED or BASE).

        git clone [REPO_ADDRESS]
        cd Android/prebuilt/[type]
        ./rooted.sh

If you are on windows and do not have BASH, use:

        git clone [REPO_ADDRESS]
        cd Android/prebuilt/[type]
        adb push pubkey_blacklist.txt /sdcard/pubkey_blacklist.txt
        adb push serial_blacklist.txt /sdcard/serial_blacklist.txt

        adb shell su -c "cp /sdcard/pubkey_blacklist.txt /data/misc/keychain/pubkey_blacklist.txt"
        adb shell su -c "cp /sdcard/serial_blacklist.txt /data/misc/keychain/serial_blacklist.txt"

### Without root access

        git clone [REPO_ADDRESS]
        cd Android/prebuilt/[type]
        adb push flashable.zip /sdcard/update.zip
        # Reboot phone to recovery
        adb reboot recovery
        # Now flash the zip file using your custom recovery

## Usage -- Building from source

First, use `git` to clone the whole repo. `cd` to this dir. Use `generate.sh`
to generate the configuration files you need.

        git clone [REPO_ADDRESS]
        cd RevokeChinaCerts/Android
        ./generate.sh extended

By substituting `extended` with `restore`, `base` or `all` you can get
corresponding configuration files.

### If you have root

If you have a rooted Android device and appropriate ADB drivers installed,
use `rooted.sh` to transfer the configuration files to your device.

        ./rooted.sh

Then, reboot the device so that the new configuration applies.

If the above method fails, please use the recovery-based approach described below.

### Recovery-based approach

After you run `generate.sh` you get a `flashable.zip` in the current folder,
which can be flashed on to Android via a custom recovery.

## Notes

The utility changes configurations under `/data` partition of your Android device,
which is wiped every time you do a factory reset or flash a factory image.

This utility doesn't remove any certificates under `/system` and should not
cause any trouble when doing OTAs. Still, this configuration overrides the certs
installed on your system. (That's to say, if you remove trust of *Wosign* using
this tool, manually installing the CA cert from *Wosign* *DOES NOT* cause
the system to see certs issued by Wosign as valid.)

On Android, each application can define its own policy of certificate validation.
An application may define custom methods to accept only some specific certificates (aka
pinning, which is also available system-wide), or accept whatever certificate regardless
of its issuer (e.g., Twidere). Having certs removed with this tool does NOT guarantee that
a particular app rejects certificates associated with those.

Blacklisting in Android works as follows. The CA certs are blacklisted by the
SHA1 checksum of their public keys and EE certs the serial number. Since serial
numbers are only required to be unique for respective certificate authorities,
blacklisting serial numbers may accidentally blacklist other *innocent* ones, especially
when the serial number is small.

The certificate blacklisting in Android is probably updated via the Play services,
and installing this tool may interfere with future blacklistings from Google, which is probably
done when setting up the first Google Account on a device and maybe sometime later. Although,
Google didn't push much certificate revocation info through this channel. Up to now (Feb of 2015)
the blacklists consists of only two respectively:

        CA Public Key: 5f3ab33d55007054bc5e3e5553cd8d8465d77c61,
                        783333c9687df63377efceddd82efa9101913e8e
        Serial Number: 827,864 [These are hex values]

Installing this tool may prevent you from getting an updated blacklist,
should a next Diginotar occurs.

For more detailed description on certificate blacklisting on Android, see
[here](http://nelenkov.blogspot.hk/2012/07/certificate-blacklisting-in-jelly-bean.html). And
[here](http://nelenkov.blogspot.hk/2012/12/certificate-pinning-in-android-42.html) for
certificate pinning.
