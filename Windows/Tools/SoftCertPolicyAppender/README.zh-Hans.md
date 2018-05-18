RevokeChinaCerts on Windows
==============

## 介绍
本文档介绍了如何使用 SoftCertPolicyAppender 工具，此工具可以将证书添加到系统强制策略列表中。

## 用法
* `SoftCertPolicyAppender.exe <参数> <证书完整路径>`
* `SoftCertPolicyAppender.exe <参数 1> <参数 2> ... <证书完整路径 1> <证书完整路径 2> ...`

## 参数
* `--help`: 输出帮助信息。
* `--set-force`: 设置强制证书规则。
* `--unset-force`: 解除强制证书规则。
* `--remove`: 移除所有列到的证书的规则。
* `--interval Time`: 如果遇到错误时的重试间隔时间，以毫秒为单位。
* `--quiet`: 安静模式，跳过所有需要选择的输入。

## 注意
* 需要管理员权限运行。
* 需要安装 [Microsoft .NET Framework 4.x](https://www.microsoft.com/en-us/download/details.aspx?id=17718) 或者更新版本。
* 依赖 [Local-Policy](https://bitbucket.org/MartinEden/local-policy/overview) 工具。
