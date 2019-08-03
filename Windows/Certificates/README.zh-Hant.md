RevokeChinaCerts on Windows
==============
Revoke Chinese certificates.

### 介紹
本文檔介紹了如何更新 CodeSigning 和 Organization 證書清單。

### 如何將證書添加到清單中
* 確保證書檔是 Base64 編碼。
* 選擇 CodeSigning 或者 Organization 類型。
* 將證書檔重命名為證書的 SHA-1 指紋和 `.crt` 副檔名。
* 將證書檔案複製到 CodeSigning 或 Organization 目錄。
* 打開 CodeSigning.txt 或 Organization.txt 清單檔。
* 將證書的 SHA-1 指紋添加到清單檔最後一行，然後保存。

### 如何從清單中刪除證書
* 找到證書檔。
* 打開 CodeSigning.txt 或 Organization.txt 清單檔。
* 從清單檔中刪除證書的 SHA-1 指紋的一整行，然後保存。
* 刪除證書檔。

### License
GNU General Public License/GNU GPL v2
