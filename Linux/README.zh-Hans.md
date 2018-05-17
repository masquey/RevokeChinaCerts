Revoke-China-Certs on Linux
==========================================

## 介绍
该工具在 Linux 撤消了某些基于 OpenSSL 和 NSS 的应用程序的 CA 证书（最值得注意的是 Firefox 和 Chrome 浏览器）。在 Linux 上有多个 SSL/TLS 库，每个库都有自己的证书存储区。其中 `/etc/ca-certificates.conf` 为 OpenSSL 配置受信任的根 CA 证书（默认使用 `wget` 工具）。另一个广泛使用的库是 Mozilla 的 NSS 它支持将特定的中间 CA 列入黑名单，而不必对 Root CA 进行操作。

请确保所有脚本必须具有执行权限。

**这个工具是实验性的，使用前请务必做好备份操作！**

## 撤销 NSS 的证书
### 用法
首先您需要安装软件包来提供 `certutil` 工具。在 Ubuntu 上是：
``` sh
sudo apt-get install libnss3-tools
```
然后使用 `revoke-china-certs.sh` 来进行撤销。对于包括 Chrome 在内的大多数基于 NSS 的应用程序，它是：
``` sh
./revoke-china-certs.sh extended $HOME/.pki/nssdb
```
撤销对 *extended* 集合中 CA 的信任。将 `extended` 改为 `all` 或 `base` 或 `restore` 来撤消或恢复其它证书集。

由于 Firefox 为不同的浏览器配置文件维护不同的证书存储（相反 Chrome 是为每个 Linux 用户）您需要为 `~/.mozilla/firefox/` 下的每个配置文件执行此操作：
``` sh
for profile in `ls -d ~/.mozilla/firefox/*.default`; do
  ./revoke-china-certs.sh extended "$profile"
done
```

### 证书锚定测试
证书锚定测试部分在 `certificate_pinning_test.py` 中，可通过以下命令使用：
``` sh
./certificate_pinning_test.py
```
这应该会测试到任何可能窃听您的连接（包括但不限于透明代理）的 HTTPS 中间人攻击设备。

这个锚定测试用例从 Android 中提取。这是实验性的，如果确实遇到错误，请提出问题与您获得的证书。

### 使用 `~/.pki/nssdb` 的程序
大多数基于 NSS 的应用程序使用 `~/.pki/nssdb` 数据库，包括但不限于：
- Curl
- Google Chrome
- Chromium
- Evolution
- GNUnet
- Wine

#### 例外
- Firefox/Iceweasel `~/.mozilla/firefox/*.default/`
- Thunderbird/Icedove `~/.thunderbird/*.default` 

### 注意
- 通过 `dpkg-reconfigure ca-certificates` 取消选择 CA 不会影响任何基于 NSS 的应用程序。
- 在 `/etc/pki/nssdb` 有一个全局数据库。在 Debian/Ubuntu 上，这个全局数据库由 `libnss3-nssdb` 安装。它实际上链接到 `/var/lib/nssdb/` 这是一个空数据库。而且由于大多数基于 NSS 的应用程序只能读取它，因此可以安全地假设它是空的。在 Arch 上，它也不是默认创建的。在 Fedora 上 `/etc/pki/nssdb` 存在，但默认情况下也不启用。虽然如果安装了 `mozilla-nss-sysinit` 时 OpenSuse 会将证书安装到 `/etc/pki/nssdb` 中。因此如果担心，可以用 `certutil -d sql：$ {DBPATH} -L` 来检查是否为空。如有必要，可通过 `revoke-china-certs.sh` 撤销证书。

## 撤销 OpenSSL 的证书
### 用法
``` sh
sudo ./cac_revoke.sh extended
```
上述命令将取消 *extended* 集合中对 CA 的信任。将 `extended` 改为 `all` 或 `base` 来撤消其它证书集合。将 `extended` 更改为 `restore` 以恢复未吊销的状态。

### 测试
确保 `wget` 在您的 `$PATH` 路径可用。
``` sh
./validator.sh
```

## 参考
[A note about SSL/TLS trusted certificate stores, and platforms (OpenSSL and GnuTLS)](https://www.happyassassin.net/2015/01/12/a-note-about-ssltls-trusted-certificate-stores-and-platforms)

## 许可证
该 Linux 实用程序在 Apache 许可证下分发。
