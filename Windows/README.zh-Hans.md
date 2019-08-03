RevokeChinaCerts on Windows
==============
Revoke Chinese certificates.

### Introduction
证书分为两大类型，请务必根据需要的情况选用：
* 在线证书：网络连接时所使用的证书
  * Online - 对系统内置的在线证书数据库进行吊销/恢复操作的批处理。
  * Firefox - 对 Firefox NSS 的证书数据库进行吊销/恢复操作的批处理。
  * Update - 对系统内置的在线证书数据库进行升级/重置操作的批处理。
* 代码和组织证书：软件发行商所发行的软件，以及组织和企业所颁发的证书
  * CodeSigning - 对系统内置的代码证书数据库进行吊销/恢复操作的批处理。
  * Organization - 对系统内置的组织证书数据库进行吊销/恢复操作的批处理。

### Usage
* [在线证书](https://github.com/chengr28/RevokeChinaCerts/tree/master/Shared/Documents/ReadMe_Online.zh-Hans.md)
* [代码和组织证书](https://github.com/chengr28/RevokeChinaCerts/tree/master/Shared/Documents/ReadMe_CodeSigning_Organization.zh-Hans.md)

### Parameter
批处理可以根据传入的参数，不需要人工干预下全自动完成对应的操作：
* 在线证书
  * 运行 `xx.bat 1` 自动进行 Revoke Base version 操作。
  * 运行 `xx.bat 2` 自动进行 Revoke Extended version 操作。
  * 运行 `xx.bat 3` 自动进行 Revoke All version 操作。
  * 运行 `xx.bat 4` 自动进行 Restore all Online revoking 操作。
  * Firefox NSS 参数
    * 运行 `xx.bat * ProfilePath` 在以上的操作基础上同时定位 Firefox 个人资料的位置。
* 代码和组织证书
  * 运行 `xx.bat 1` 自动进行吊销操作。
  * 运行 `xx.bat 2` 自动进行恢复操作。
  * 运行 `xx.bat * -f` 在以上的操作基础上启用软件强制策略。

### License
GNU General Public License/GNU GPL v2
