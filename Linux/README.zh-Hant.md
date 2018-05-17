Revoke-China-Certs on Linux
==========================================

## 介紹
該工具在 Linux 撤銷了某些基於 OpenSSL 和 NSS 的應用程式的 CA 憑證（最值得注意的是 Firefox 和 Chrome 瀏覽器）。在 Linux 上有多個 SSL/TLS 庫，每個庫都有自己的憑證存放區區。其中 `/etc/ca-certificates.conf` 為 OpenSSL 配置受信任的根 CA 憑證（預設使用 `wget` 工具）。另一個廣泛使用的庫是 Mozilla 的 NSS 它支援將特定的中間 CA 列入黑名單，而不必對 Root CA 進行操作。

請確保所有腳本必須具有執行許可權。

**這個工具是實驗性的，使用前請務必做好備份操作！**

## 撤銷 NSS 的證書
### 用法
首先您需要安裝套裝軟體來提供 `certutil` 工具。在 Ubuntu 上是：
``` sh
sudo apt-get install libnss3-tools
```
然後使用 `revoke-china-certs.sh` 來進行撤銷。對於包括 Chrome 在內的大多數基於 NSS 的應用程式，它是：
``` sh
./revoke-china-certs.sh extended $HOME/.pki/nssdb
```
撤銷對 *extended* 集合中 CA 的信任。將 `extended` 改為 `all` 或 `base` 或 `restore` 來撤銷或恢復其它證書集。

由於 Firefox 為不同的瀏覽器設定檔維護不同的憑證存放區（相反 Chrome 是為每個 Linux 使用者）您需要為 `~/.mozilla/firefox/` 下的每個設定檔執行此操作：
``` sh
for profile in `ls -d ~/.mozilla/firefox/*.default`; do
  ./revoke-china-certs.sh extended "$profile"
done
```

### 證書錨定測試
證書錨定測試部分在 `certificate_pinning_test.py` 中，可通過以下命令使用：
``` sh
./certificate_pinning_test.py
```
這應該會測試到任何可能竊聽您的連接（包括但不限於透明代理）的 HTTPS 中間人攻擊設備。

這個錨定測試案例從 Android 中提取。這是實驗性的，如果確實遇到錯誤，請提出問題與您獲得的證書。

### 使用 `~/.pki/nssdb` 的程式
大多數基於 NSS 的應用程式使用 `~/.pki/nssdb` 資料庫，包括但不限於：
- Curl
- Google Chrome
- Chromium
- Evolution
- GNUnet
- Wine

### 例外
- Firefox/Iceweasel `~/.mozilla/firefox/*.default/`
- Thunderbird/Icedove `~/.thunderbird/*.default` 

### 注意
- 通過 `dpkg-reconfigure ca-certificates` 取消選擇 CA 不會影響任何基於 NSS 的應用程式。
- 在 `/etc/pki/nssdb` 有一個全域資料庫。在 Debian/Ubuntu 上，這個全域資料庫由 `libnss3-nssdb` 安裝。它實際上連結到 `/var/lib/nssdb/` 這是一個空資料庫。而且由於大多數基於 NSS 的應用程式只能讀取它，因此可以安全地假設它是空的。在 Arch 上，它也不是預設創建的。在 Fedora 上 `/etc/pki/nssdb` 存在，但預設情況下也不啟用。雖然如果安裝了 `mozilla-nss-sysinit` 時 OpenSuse 會將證書安裝到 `/etc/pki/nssdb` 中。因此如果擔心，可以用 `certutil -d sql：$ {DBPATH} -L` 來檢查是否為空。如有必要，可通過 `revoke-china-certs.sh` 撤銷證書。

## 撤銷 OpenSSL 的證書
### 用法
``` sh
sudo ./cac_revoke.sh extended
```
上述命令將取消 *extended* 集合中對 CA 的信任。將 `extended` 改為 `all` 或 `base` 來撤銷其它證書集合。將 `extended` 更改為 `restore` 以恢復未吊銷的狀態。

### 測試
確保 `wget` 在您的 `$PATH` 路徑可用。
``` sh
./validator.sh
```

## 參考
[A note about SSL/TLS trusted certificate stores, and platforms (OpenSSL and GnuTLS)](https://www.happyassassin.net/2015/01/12/a-note-about-ssltls-trusted-certificate-stores-and-platforms)

## 許可證
該 Linux 實用程式在 Apache 許可證下分發。
