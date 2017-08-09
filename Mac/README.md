# Revoke China Certs on macOS

Mark certifications from China as **not trusted** on macOS.


## Usage

### Import Trust Settings

```
./import-trust-settings.sh
```

This will merge new trust settings into existing settings.

If you'd like to overwrite all existing settings, simply run:

``` sh
sudo security trust-settings-import -d TrustSettings.plist
```


### Test Trust Setting

``` sh
./test-trust-settings.sh
```

This will test all urls found in [test/test-url-list.txt](test/test-url-list.txt). It will use `curl` by default.

To run the test with `wget`, you can set `$TESTDRIVER` environment variable.

``` sh
TESTDRIVER=wget ./test-trust-settings.sh
```

Beware that `wget` must be built with Apple's SSL library to take effect of trust settings.


### Rebuild Trust Settings

``` sh
MODE=essential ./build-trust-settings.sh
```

This will rebuild trust settings using certificates in [Severity.High.md](../Shared/Certificates/Severity.High.md).

```
MODE=recommend ./build-trust-settings.sh
```

This will rebuild trust settings using certificates in [Severity.High.md](../Shared/Certificates/Severity.High.md) and [Severity.Medium.md](../Shared/Certificates/Severity.Medium.md). *Default*.

```
MODE=strict ./build-trust-settings.sh
```

This will rebuild trust settings using certificates in [Severity.High.md](../Shared/Certificates/Severity.High.md), [Severity.Medium.md](../Shared/Certificates/Severity.Medium.md) and [Severity.Low.md](../Shared/Certificates/Severity.Low.md).

> See [Certificates/README.md](../Shared/Certificates/README.md) for more details.


### Reset Trust Settings

``` sh
./libexec/security-trust-settings-merge SystemDefault.plist
sudo security trust-settings-import -d SystemDefault.plist
```

This will restore your trust settings to system default.



## License

The [security-trust-settings-tools](https://github.com/ntkme/security-trust-settings-tools) included in this project is licensed under [BSD 2-clause License](https://github.com/ntkme/security-trust-settings-tools/blob/master/LICENSE).
