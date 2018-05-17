# Revoke China Certs on macOS
在 macOS 上將來自大中華區的證書標記為 **不可信** 的工具。

## Usage
在 macOS 上將證書設置為不可信的步驟：
1. 重建信任設置
2. 導入信任設置
3. 測試信任設置
4. 檢查測試結果

### 導入信任設置
```
./import-trust-settings.sh
```
這會將新的信任設置合併到現有設置中。如果您想覆蓋所有現有設置，只需運行：
``` sh
sudo security trust-settings-import -d TrustSettings.plist
```

### 測試信任設置
``` sh
./test-trust-settings.sh
```
這會將對所有記錄在 [test/test-url-list.txt](test/test-url-list.txt) 的 URL 進行測試，預設使用 `curl` 工具。

如果您想使用 `wget` 則可以設置 `$TESTDRIVER`環境變量。
``` sh
TESTDRIVER=wget ./test-trust-settings.sh
```
請注意，必須使用 Apple 的 SSL 庫所構建的 `wget` 才能生成信任設置。

### 重建信任設置
``` sh
MODE=essential ./build-trust-settings.sh
```
這將使用 [Severity.High.md](../Shared/Certificates/Severity.High.md) 的證書清單重建信任設置。
```
MODE=recommend ./build-trust-settings.sh
```
這將使用 [Severity.High.md](../Shared/Certificates/Severity.High.md) 和 [Severity.Medium.md](../Shared/Certificates/Severity.Medium.md) 的證書清單重建信任設置，這是預設的設置。
```
MODE=strict ./build-trust-settings.sh
```
這將使用 [Severity.High.md](../Shared/Certificates/Severity.High.md) 和 [Severity.Medium.md](../Shared/Certificates/Severity.Medium.md) 以及 [Severity.Low.md](../Shared/Certificates/Severity.Low.md) 的證書清單重建信任設置。
> 如需獲得更多的資料，請移步 [Certificates/README.md](../Shared/Certificates/README.md) 檔。

### 重置信任設置
``` sh
./libexec/security-trust-settings-merge SystemDefault.plist
sudo security trust-settings-import -d SystemDefault.plist
```
這會將您的信任設置恢復到系統預設值。

## License
包含在這個專案的 [security-trust-settings-tools](https://github.com/ntkme/security-trust-settings-tools) 工具根據 [BSD 2-clause License](https://github.com/ntkme/security-trust-settings-tools/blob/master/LICENSE) 進行授權。
