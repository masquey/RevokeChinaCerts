RevokeChinaCerts
==============
Revoke Chinese certificates.

### 使用方法
* 直接运行 `RevokeChinaCerts_CodeSigning.bat` 或 `RevokeChinaCerts_Organization.bat` 并根据提示操作即可。
* `Set force` 为证书强制策略，启用后将强制检查证书的使用，不启用 UAC 的情况下也无法运行被吊销证书的软件。添加证书强制策略的工具需要管理员权限以及 Microsoft .NET Framework 4.0 或更新版本的支持。

### 批处理/脚本类型
* **1/吊销版本**：吊销了所有列表中代码签名的证书。
* **2/恢复版本**：可恢复所有在上面几个版本中所有被加入吊销列表的证书的使用。
* Choice/提示选择版本：已不再受支持。如果需要实现类似的功能，可编辑 /Windows/Certificates/CodeSigning/CodeSigning.txt 或者 /Windows/Certificates/Organization/Organization.txt 目录删除涉及的证书一节中提到对应的证书指纹，保存列表文件后再进行吊销。

### 涉及的证书
参见 [ReadMe_CodeSigning_Organization.md](ReadMe_CodeSigning_Organization.md)
