RevokeChinaCerts on Windows
==============

## Usage
* `SoftCertPolicyAppender.exe <参数> <证书完整路径>`
* `SoftCertPolicyAppender.exe <参数> <证书完整路径 1> <证书完整路径 2> ...`

## Parameter
* `--help`: 輸出説明資訊。
* `--set-force`: 設置強制證書規則。
* `--unset-force`: 解除強制證書規則。
* `--remove`: 移除所有列到的證書的規則。
* `--interval Time`: 如果遇到錯誤時的重試間隔時間，以毫秒為單位。
* `--quiet`: 安靜模式，跳過所有需要選擇的輸入。

## Notice
* 需要管理員許可權運行。
* 需要安裝 [Microsoft .NET Framework 4.x](https://www.microsoft.com/en-us/download/details.aspx?id=17718) 或者更新版本。
* 依賴 [Local-Policy](https://bitbucket.org/MartinEden/local-policy/overview) 工具。
