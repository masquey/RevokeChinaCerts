Revoke-China-Certs on Linux
==========================================

## Intro

This tool revokes certain CA certificates for NSS-based applications on Linux,
(most notably, Firefox & Chrome).

On Linux there are multiple libraries for SSL/TLS and each may have its own
certificate store. The `/etc/ca-certificates.conf` configures the trusted
Root CAs for OpenSSL (which `wget` uses by default). Another widely used
library is NSS by Mozilla, which supports blacklisting a specific intermediate
CA without fiddling with the Root CA.

**This tool is experimental. DO MAKE BACKUPS before you do anything!**

## Usage

First you need to have packages installed to provide `certutil`. On Ubuntu it would be:

        sudo apt-get install libnss3-tools

Then, use the `revoke-china-certs.sh` to do the revocation. For Chrome it would be:

        ./revoke-china-certs.sh extended $HOME/.pki/nssdb

to revoke trust of CAs within the *extended* set. Change `extended` to `all` or `base`
or `restore` to revoke other sets of certs.

Since Firefox maintains different certificate store for different browser profile (rather
than per Linux user for Chrome), you need to do this for every profile under `~/.mozilla/firefox`.

        for profile in `ls ~/.mozilla/firefox/*.default`;do
            ./revoke-china-certs.sh extended $HOME/.mozilla/firefox/$profile
        done

## Certificate Pinning Test

Certificate pinning test is implemented in `certificate_pinning_test.py`.
Use it as:

    ./certificate_pinning_test.py

This should reveal any HTTPS Man-In-The-Middle devices that may eavesdrop
your connection (with Google), including but not limited to a transparent
proxy.

The pinning test uses signatures extracted from Android.

(This is experimental. If you do encounter an error, please file an issue
with the certificate you get.)

## Notes

Deselecting a CA by `dpkg-reconfigure ca-certificates` does NOT affect any NSS-based applications.
