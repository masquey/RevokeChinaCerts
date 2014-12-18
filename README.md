RevokeChinaCerts
==============
Revoke China Certificates.<br />
全自动可疑证书吊销工具/全自動可疑憑證撤銷工具<br />

### Updated
**2014-12-18**

### Usage
* [English version](https://github.com/chengr28/RevokeChinaCerts/wiki/ReadMe)
* [简体中文使用说明](https://github.com/chengr28/RevokeChinaCerts/wiki/ReadMe(Chinese_Simplified))
* [繁體中文使用說明](https://github.com/chengr28/RevokeChinaCerts/wiki/ReadMe(Chinese_Traditional))

### Special/特别说明/特別說明
* **Extended** and **All** version will revoke `GoAgent CA` using in GoAgent. Please delete `CA.crt` and `certs` folder which in GoAgent program folder(if it exists). Finally, clear all browser(s) data and restart GoAgent.
* **Extended** 版和 **All** 版会自动吊销 GoAgent 自带的 `GoAgent CA` 证书，为免使用 GoAgent 时出现错误同时也为了系统加密连接的安全强烈建议更换其自带的 CA 根证书。**关闭所有 GoAgent 程序，进入其 `local` 目录删除 `CA.crt` 以及整个 `certs` 目录，然后清空所有浏览器数据重启 GoAgent 和浏览器即可。**
* **Extended** 版和 **All** 版會自動吊銷 GoAgent 自帶的 `GoAgent CA` 證書，為免使用 GoAgent 時出現錯誤同時也為了系統加密連接的安全強烈建議更換其自帶的 CA 根憑證。**關閉所有 GoAgent 程式，進入其 `local` 目錄刪除 `CA.crt` 以及整個 `certs` 目錄，然後清空所有瀏覽器資料重啟 GoAgent 和瀏覽器即可。**
