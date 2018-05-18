RevokeChinaCerts on Windows
==============

### 介绍
本文档介绍了如何更新 CodeSigning 和 Organization 证书列表。

### 如何将证书添加到列表中
* 确保证书文件是 Base64 编码。
* 选择 CodeSigning 或者 Organization 类型。
* 将证书文件重命名为证书的 SHA-1 指纹和 `.crt` 扩展名。
* 将证书文件复制到 CodeSigning 或 Organization 目录。
* 打开 CodeSigning.txt 或 Organization.txt 列表文件。
* 将证书的 SHA-1 指纹添加到列表文件最后一行，然后保存。

### 如何从列表中删除证书
* 找到证书文件。
* 打开 CodeSigning.txt 或 Organization.txt 列表文件。
* 从列表文件中删除证书的 SHA-1 指纹的一整行，然后保存。
* 删除证书文件。

### License
GNU General Public License/GNU GPL v2
