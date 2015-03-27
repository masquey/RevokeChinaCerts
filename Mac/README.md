# Revoke-China-Certs on OS X

## Introduction

This tool marks all Chinese online certifications as not trusted for OS X.

## Usage

### Import Trust Settings

```
./import-trust-settings.sh
```

This will merge new trust settings into existing settings.

If you'd like to ignore all existing settings, simply run:

``` sh
sudo security trust-settings-import -d TrustSettings.plist
```

### Test Trust Setting

``` sh
./test-trust-settings.sh
```

This will run all tests using urls found in [test/test-url-list.txt](test/test-url-list.txt).

To run the test manually against a single url, use the following command:

``` sh
./test/test-url.sh https://example.com/
```


### Rebuild Trust Settings

``` sh
./build-trust-settings.sh
```

This will rebuild trust settings using all online certs found in Windows version.

To build a blacklist with your own choice of certifications, edit `$ISSUERS` and `$CERTIFICATIONS` in [build-trust-settings.sh](build-trust-settings.sh).



## License

The [security-trust-settings-tools](https://github.com/ntkme/security-trust-settings-tools) included in this project is licensed under [BSD 2-clause License](https://github.com/ntkme/security-trust-settings-tools/blob/master/LICENSE).
