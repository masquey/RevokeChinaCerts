Certificates
============

## 放在这里的是什么？
证书分为 3 个不同的安全等级，每个证书均以 `.crt` 格式的 SHA-1 指纹命名。

### 安全等级的定义
- High
  - 任何已知被用于中间人攻击的证书。
  - 任何具有被用于攻击的高风险的 CA 证书。
- Medium
  - 自签名的 CA 证书有很高的被攻击风险。
  - 具有低风险被用于攻击的 CA 证书。
- Low
  - 其它来自大中华区的证书。

### 证书的可读介绍
- [Severity.High.md](Severity.High.md)
- [Severity.Medium.md](Severity.Medium.md)
- [Severity.Low.md](Severity.Low.md)

## 我应该如何添加证书？
1. 将 PEM 编码版本的扩展名为 `.crt` 的证书放入此目录中。
2. 运行 `./rehash.sh` 将新添加的 `.crt` 重命名为它的 SHA-1 指纹。
3. 通过将其 SHA-1 指纹放入其中 1 个列表来定义其安全级别。
4. 运行 `./update.sh` 以更新所有的脚本和批处理。
