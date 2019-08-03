RevokeChinaCerts on Windows
==============
Revoke Chinese certificates.

## 介紹
本文檔介紹了如何使用 SoftCertPolicyAppender 工具，此工具可以將證書添加到系統強制策略清單中。

## 用法
* `SoftCertPolicyAppender.exe <参数> <证书完整路径>`
* `SoftCertPolicyAppender.exe <参数 1> <参数 2> ... <证书完整路径 1> <证书完整路径 2> ...`

## 參數
* `--help`: 輸出説明資訊。
* `--set-force`: 設置強制證書規則。
* `--unset-force`: 解除強制證書規則。
* `--remove`: 移除所有列到的證書的規則。
* `--interval Time`: 如果遇到錯誤時的重試間隔時間，以毫秒為單位。
* `--quiet`: 安靜模式，跳過所有需要選擇的輸入。

## 注意
* 需要管理員許可權運行。
* 需要安裝 [Microsoft .NET Framework 4.x](https://www.microsoft.com/en-us/download/details.aspx?id=17718) 或者更新版本。
* 依賴 [Local-Policy](https://bitbucket.org/MartinEden/local-policy/overview) 工具。
