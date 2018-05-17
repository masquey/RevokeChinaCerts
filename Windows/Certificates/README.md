RevokeChinaCerts on Windows
==============

### How do I add certificate to the list?
* Make sure the certificate is Base64 encoding.
* Select a type, CodeSigning or Organization
* Rename the certificate as SHA-1 fingerprint and `.crt`.
* Copy the certificate file to CodeSigning or Organization.
* Open `CodeSigning.txt` or `Organization.txt`.
* Add the certificate SHA-1 fingerprint to the end and save.

### How do I remove certificate from the list?
* Locate the certificate file.
* Open `CodeSigning.txt` or `Organization.txt`.
* Remove the certificate SHA-1 fingerprint from the list file and save.
* Remove the certificate file.

### License
GNU General Public License/GNU GPL v2
