### 使用方法
* 直接运行 `RevokeChinaCerts_CodeSigning.bat` 或 `RevokeChinaCerts_Organization.bat` 并根据提示操作即可
* `Set force` 为证书强制策略，启用后将强制检查证书的使用，在不启用 UAC 的情况也不能运行被吊销证书的软件。需要注意的是，添加的工具需要 Microsoft .NET Framework 4.0+ 的支持

### 批处理/脚本类型
* **1/完全版本**：吊销了所有列表中代码签名的证书
* **2/Restore/恢复版本**：可恢复所有在上面几个版本中所有被加入吊销列表的证书的使用
* **Choice/提示选择版本**：已不再受支持，如果需要实现类似的功能，可直接到 /Windows/Certificates/CodeSigning 或者 /Windows/Certificates/Organization 目录删除涉及的证书一节中提到对应的证书文件，再运行完全版本进行吊销

### 涉及的证书
参见 [ReadMe_CodeSigning_Organization.md](ReadMe_CodeSigning_Organization.md)
