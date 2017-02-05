Android证书屏蔽
=====================================================

本工具为 Android 4.1 或以上之设备安装用于屏蔽某些数字证书的配置。

## 简介

本工具安装的配置文件将屏蔽某些 CA 和 EE 证书。

## 推荐用法

### 有 root 权限

若您持有待配置之 Android 设备 root 访问，请在 `cd` 进入对应名称的文件夹中
(RESTORE, ALL, EXTENDED or BASE，推荐 EXTENDED)，并调用 root.sh 文件安装入对应的配置文件。

        git clone [REPO_ADDRESS]
        cd Android/prebuilt/[type]
        ./rooted.sh

若您使用 Windows 平台且未有 BASH，请在命令行中运行：

        git clone [REPO_ADDRESS]
        cd Android/prebuilt/[type]
        adb push pubkey_blacklist.txt /sdcard/pubkey_blacklist.txt
        adb push serial_blacklist.txt /sdcard/serial_blacklist.txt

        adb shell su -c "cp /sdcard/pubkey_blacklist.txt /data/misc/keychain/pubkey_blacklist.txt"
        adb shell su -c "cp /sdcard/serial_blacklist.txt /data/misc/keychain/serial_blacklist.txt"

### 若无 root 权限

        git clone [REPO_ADDRESS]
        cd Android/prebuilt/[type]
        adb push flashable.zip /sdcard/update.zip
        # 下面命令将重启您的 Android 设备至 recovery 状态
        adb reboot recovery
        # 请使用 recovery 刷入 zip 包

更具体的使用方法，详见 README.md

## 授权

本工具在 Apache License 下授权。
