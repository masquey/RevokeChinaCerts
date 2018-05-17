RevokeChinaCerts on Windows
==============

## Usage
* `SoftCertPolicyAppender.exe <parameter> <certificate path>`
* `SoftCertPolicyAppender.exe <parameter> <certificate path 1> <certificate path 2> ...`

## Parameter
* `--help`: Print help message.
* `--set-force`: Set force certificate policy.
* `--unset-force`: Unset force certificate policy.
* `--remove`: Remove certificate rule by CERTFILEs not add.
* `--interval Time`: Interval time if get exception. Time is in milliseconds.
* `--quiet`: Quiet mode, no any asking.

## Notice
* Need administrative privileges.
* Need [Microsoft .NET Framework 4.x](https://www.microsoft.com/en-us/download/details.aspx?id=17718) or later version.
* Depend on [Local-Policy](https://bitbucket.org/MartinEden/local-policy/overview).
