Certificates
============

## 這裡是什麼？
證書分為 3 個不同的安全等級，每個證書均以 `.crt` 格式的 SHA-1 指紋命名。

### 安全等級的定義
- High
  - 任何已知被用於中間人攻擊的證書。
  - 任何具有被用於攻擊的高風險的 CA 憑證。
- Medium
  - 自簽名的 CA 憑證有很高的被攻擊風險。
  - 具有低風險被用於攻擊的 CA 憑證。
- Low
  - 其它來自大中華區的證書。

### 證書的可讀介紹
- [Severity.High.md](Severity.High.md)
- [Severity.Medium.md](Severity.Medium.md)
- [Severity.Low.md](Severity.Low.md)

## 我應該如何添加證書？
1. 將 PEM 編碼版本的副檔名為 `.crt` 的證書放入此目錄中。
2. 運行 `./rehash.sh` 將新添加的 `.crt` 重命名為它的 SHA-1 指紋。
3. 通過將其 SHA-1 指紋放入其中 1 個清單來定義其安全級別。
4. 運行 `./update.sh` 以更新所有的腳本和批次處理。
