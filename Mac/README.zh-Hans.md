# Revoke China Certs on macOS
在 macOS 上将来自大中华区的证书标记为 **不可信** 的工具。

## Usage
在 macOS 上将证书设置为不可信的步骤：
1. 重建信任设置
2. 导入信任设置
3. 测试信任设置
4. 检查测试结果

### 导入信任设置
```
./import-trust-settings.sh
```
这会将新的信任设置合并到现有设置中。如果您想覆盖所有现有设置，只需运行：
``` sh
sudo security trust-settings-import -d TrustSettings.plist
```

### 测试信任设置
``` sh
./test-trust-settings.sh
```
这会将对所有记录在 [test/test-url-list.txt](test/test-url-list.txt) 的 URL 进行测试，默认使用 `curl` 工具。

如果您想使用 `wget` 则可以设置 `$TESTDRIVER`环境变量。
``` sh
TESTDRIVER=wget ./test-trust-settings.sh
```
请注意，必须使用 Apple 的 SSL 库所构建的 `wget` 才能生成信任设置。

### 重建信任设置
``` sh
MODE=essential ./build-trust-settings.sh
```
这将使用 [Severity.High.md](../Shared/Certificates/Severity.High.md) 的证书列表重建信任设置。
```
MODE=recommend ./build-trust-settings.sh
```
这将使用 [Severity.High.md](../Shared/Certificates/Severity.High.md) 和 [Severity.Medium.md](../Shared/Certificates/Severity.Medium.md) 的证书列表重建信任设置，这是默认的设置。
```
MODE=strict ./build-trust-settings.sh
```
这将使用 [Severity.High.md](../Shared/Certificates/Severity.High.md) 和 [Severity.Medium.md](../Shared/Certificates/Severity.Medium.md) 以及 [Severity.Low.md](../Shared/Certificates/Severity.Low.md) 的证书列表重建信任设置。
> 如需获得更多的资料，请移步 [Certificates/README.md](../Shared/Certificates/README.md) 文件。

### 重置信任设置
``` sh
./libexec/security-trust-settings-merge SystemDefault.plist
sudo security trust-settings-import -d SystemDefault.plist
```
这会将您的信任设置恢复到系统默认值。

## 许可证
包含在这个项目的 [security-trust-settings-tools](https://github.com/ntkme/security-trust-settings-tools) 工具根据 [BSD 2-clause License](https://github.com/ntkme/security-trust-settings-tools/blob/master/LICENSE) 进行授权。
