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

Then, use the `revoke-china-certs.sh` to do the revocation.
For most NSS-based applications including Chrome, it would be:

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

## Applications use `~/.pki/nssdb`

Most NSS-based applications use `~/.pki/nssdb`, including but not limited to:

- Curl
- Google Chrome
- Chromium
- Evolution
- GNUnet
- Wine

### Exceptions

- Firefox/Iceweasel `~/.mozilla/firefox/*.default/`
- Thunderbird/Icedove `~/.thunderbird/*.default` 

## Notes

- Deselecting a CA by `dpkg-reconfigure ca-certificates` does NOT affect any NSS-based applications.
- There is a global database at `/etc/pki/nssdb`. On Debian/Ubuntu, this
  global database is installed by `libnss3-nssdb`. And it actually links to
  `/var/lib/nssdb/`, which is an empty database. And since most NSS based applications only read it, so it's safe to assume that it is empty. On Arch
  it is not created by default, too. On Fedora `/etc/pki/nssdb` exists but is
  also not enabled by default. Though OpenSuse will install certificates into
  `/etc/pki/nssdb` provided that `mozilla-nss-sysinit` is installed. Thus if
  you worry about it, you can check its emptiness with `certutil -d sql:${DBPATH} -L`
  yourself. And revoke certificates in it via `revoke-china-certs.sh` if necessary.


