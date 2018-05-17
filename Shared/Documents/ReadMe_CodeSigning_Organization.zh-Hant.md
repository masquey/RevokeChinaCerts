RevokeChinaCerts
==============

### 使用方法
* 直接運行 `RevokeChinaCerts_CodeSigning.bat` 或 `RevokeChinaCerts_Organization.bat` 並根據提示操作即可。
* `Set force` 為證書強制策略，啟用後將強制檢查證書的使用，不啟用 UAC 的情況下也無法運行被吊銷證書的軟體。添加證書強制策略的工具需要管理員許可權以及 Microsoft .NET Framework 4.0 或更新版本的支援。

### 批次處理/腳本類型
* **1/吊销版本**：吊銷了所有清單中代碼簽名的證書。
* **2/恢復版本**：可恢復所有在上面幾個版本中所有被加入吊銷清單的證書的使用。
* Choice/提示選擇版本：已不再受支援。如果需要實現類似的功能，可編輯 /Windows/Certificates/CodeSigning/CodeSigning.txt 或者 /Windows/Certificates/Organization/Organization.txt 目錄刪除涉及的證書一節中提到對應的證書指紋，保存清單檔後再進行吊銷。

### 涉及的證書
參見 [ReadMe_CodeSigning_Organization.md](ReadMe_CodeSigning_Organization.md)
