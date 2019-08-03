RevokeChinaCerts on Windows
==============
Revoke Chinese certificates.

### Introduction
證書分為兩大類型，請務必根據需要的情況選用：
* 線上證書：網路連接時所使用的證書
  * Online - 對系統內置的線上證書資料庫進行吊銷/恢復操作的批次處理。
  * Firefox - 對 Firefox NSS 的證書資料庫進行吊銷/恢復操作的批次處理。
  * Update - 對系統內置的線上證書資料庫進行升級/重置操作的批次處理。
* 代碼和組織證書：軟體發行商所發行的軟體，以及組織和企業所頒發的證書
  * CodeSigning - 對系統內置的代碼證書資料庫進行吊銷/恢復操作的批次處理。
  * Organization - 對系統內置的組織證書資料庫進行吊銷/恢復操作的批次處理。

### Usage
* [線上證書](https://github.com/chengr28/RevokeChinaCerts/tree/master/Shared/Documents/ReadMe_Online.zh-Hant.md)
* [代碼和組織證書](https://github.com/chengr28/RevokeChinaCerts/tree/master/Shared/Documents/ReadMe_CodeSigning_Organization.zh-Hant.md)

### Parameter
批次處理可以根據傳入的參數，不需要人工干預下全自動完成對應的操作：
* 線上證書
  * 運行 `xx.bat 1` 自動進行 Revoke Base version 操作。
  * 運行 `xx.bat 2` 自動進行 Revoke Extended version 操作。
  * 運行 `xx.bat 3` 自動進行 Revoke All version 操作。
  * 運行 `xx.bat 4` 自動進行 Restore all Online revoking 操作。
  * Firefox NSS 參數
    * 運行 `xx.bat * ProfilePath` 在以上的操作基礎上同時定位 Firefox 個人資料的位置。
* 代碼和組織證書
  * 運行 `xx.bat 1` 自動進行非軟體強制策略的吊銷操作。
  * 運行 `xx.bat 2` 自動進行非軟體強制策略的恢復操作。
  * 運行 `xx.bat * -f` 在以上的操作基礎上啟用軟體強制策略。

### License
GNU General Public License/GNU GPL v2
