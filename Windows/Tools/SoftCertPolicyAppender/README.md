RevokeChinaCerts on Windows
==============

## Usage
- `SoftCertPolicyAppender.exe <parameter> <certificate path>`
- `SoftCertPolicyAppender.exe <parameter> <certificate path> <certificate path 2> ...`

## Parameter
- `--set-force` - Enable  force certificate policy.
- `--unset-force` - Disable force certificate policy.
- `-r` - Remove certificate policy.
- `-h` - Print guide and help message.

## Notice
- Need administrative privileges
- Need [Microsoft .NET Framework 4.x](https://www.microsoft.com/en-us/download/details.aspx?id=17718) and later
- Depend on [Local-Policy](https://bitbucket.org/MartinEden/local-policy/overview)
