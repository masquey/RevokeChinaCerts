Android 證書屏蔽
=====================================================

本工具為 Android 4.1 或以上之設備安裝用於屏蔽某些數位憑證的配置。

## 簡介
本工具安裝的設定檔將屏蔽某些 CA 和 EE 證書。使用前請確保所有腳本具有執行許可權。

## 用法 -- 使用預先生成的設定檔（推薦）
### 有 root 許可權
若您持有待配置之 Android 設備 root 訪問，請在 `cd` 進入對應名稱的資料夾中 (RESTORE, ALL, EXTENDED or BASE，推薦 EXTENDED) 並調用 root.sh 檔安裝入對應的設定檔。

        git clone [REPO_ADDRESS]
        cd Android/prebuilt/[type]
        ./rooted.sh

若您使用 Windows 平臺且未有 BASH，請在命令列中運行：

        git clone [REPO_ADDRESS]
        cd Android/prebuilt/[type]
        adb push pubkey_blacklist.txt /sdcard/pubkey_blacklist.txt
        adb push serial_blacklist.txt /sdcard/serial_blacklist.txt

        adb shell su -c "cp /sdcard/pubkey_blacklist.txt /data/misc/keychain/pubkey_blacklist.txt"
        adb shell su -c "cp /sdcard/serial_blacklist.txt /data/misc/keychain/serial_blacklist.txt"

### 若無 root 許可權

        git clone [REPO_ADDRESS]
        cd Android/prebuilt/[type]
        adb push flashable.zip /sdcard/update.zip
        # 下面命令將重啟您的 Android 設備至 recovery 狀態
        adb reboot recovery
        # 請使用 recovery 刷入 zip 包

## 用法 -- 通過原始程式碼組建設定檔
首先使用 `git` 克隆整個專案並 `cd` 到這個目錄。使用 `generate.sh` 來生成您需要的設定檔。

        git clone [REPO_ADDRESS]
        cd RevokeChinaCerts/Android
        ./generate.sh extended

通過用 `restore` 或 `base` 或 `all` 來代替 `extended` 以得到相應的設定檔。

### 有 root 許可權
如果您的 Android 設備有 root 許可權和適當的 ADB 驅動程式，請使用 `rooted.sh` 將配置檔案傳輸到您的設備。

        ./rooted.sh

然後重新開機設備，以便應用新配置。如果上述方法失敗，請使用下面提到的恢復方法。

### 恢復方法
運行 `generate.sh` 之後，您會在當前資料夾中獲得一個 `flashable.zip` 它可以第三方廠商的 recovery 程式刷入 Android 上。

## 注意
程式更改 Android 設備的 `/data` 分區下的配置，每當您進行資料重置或刷入工廠鏡像時都會擦除該設備。

此實用程式不會刪除 `/system` 下的任何證書，所以在執行 OTA 時不會造成任何麻煩。不過這種配置會覆蓋您的系統上安裝的證書（也就是說，如果您使用此工具刪除 *Wosign* 的信任，請從 *Wosign* 手動安裝 CA 憑證，此操作 *不會* 導致系統將 Wosign 頒發的證書視為有效）。

在 Android 上，每個應用程式都可以定義自己的證書驗證策略。應用程式可以定義自訂方法來僅接受某些特定的證書（稱為錨定，也可以在系統範圍內使用），或者接受任何證書而不管其頒發者（例如 Twidere）。使用此工具刪除證書 *不保證* 特定的應用拒絕與這些證書關聯的證書。

Android 中的黑名單工作如下。CA 憑證通過公開金鑰的 SHA-1 校驗和列入黑名單並 EE 證明序號。由於序號對於相應的憑證授權單位只需要是唯一的，所以列入黑名單的序號可能會意外地將其它 *無辜* 列入黑名單，特別是當序號很小時。

Android 中的證書黑名單可能通過 Play Services 進行更新，安裝此工具可能會干擾未來的 Google 黑名單，這可能是在設備上設置第一個 Google 帳戶時完成的，也可能是在稍後的某個時間。雖然 Google 沒有通過這個管道推送更多的證書撤銷資訊。截至目前（2015年2月），黑名單僅分別由兩部分組成：

        CA Public Key: 5f3ab33d55007054bc5e3e5553cd8d8465d77c61,
                        783333c9687df63377efceddd82efa9101913e8e
        Serial Number: 827,864 [這是 16 進制數值]

如果發生下一個類似 Diginotar 的事件，安裝此工具可能會阻止您獲取更新的黑名單。

有關 Android 上證書黑名單的更多詳細說明，請參閱 [這裡](https://nelenkov.blogspot.com/2012/07/certificate-blacklisting-in-jelly-bean.html)。關於證書錨定功能，請參閱 [這裡](https://nelenkov.blogspot.com/2012/12/certificate-pinning-in-android-42.html)。

## 授權
本工具在 Apache License 下授權。
