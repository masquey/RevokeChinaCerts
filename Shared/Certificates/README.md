Certificates
============

## What's here?

Certificates categorized in three severity level.

Each certificate is named with its SHA1 fingerprint, in `.crt` format.

### Definition of Severity Level

- High
  - Any certificates that have been used for man-in-the-middle attack
  - CA certificates that have high risk of being used for attack.
- Medium
  - Self-signed CA certificates that have high risk of being used for attack.
  - CA certificates that have low risk of being used for attack.
- Low
  - All other certificates from the Greater China

### Human Readable Certificates Details

- [Severity.High.md](Severity.High.md)
- [Severity.Medium.md](Severity.Medium.md)
- [Severity.Low.md](Severity.Low.md)

## How do I add a certificate?

1. Put PEM encoded version of the certificate with `.crt` extension in this folder.
2. Run `./rehash.sh` to rename the newly added `.crt` to its SHA1 fingerprint.
3. Define its severity by put its SHA1 fingerprint into one of the severity list.
4. Run `./update.sh` to run all update hooks.
